require 'minitest/autorun'
require_relative 'runner'
#require 'json'





class TestThing < MiniTest::Test
  def test_selfsrcjson
    puts('I\m here 1')
    sourceObject = '
    {
       "tests" : [
          {
             "output" : "MQo=",
             "name" : "Large Input",
             "input" : "NQoxIDIgLTIgMjU3IC0zCg=="
          }
       ],
       "command" : "ruby test.rb",
       "code" : "cCBbKiQ8XVsxXS5zcGxpdC5taW5fYnl7fGx8dj1sLnRvX2k7dioqNC12fS50b19p",
       "file" : "test.rb"
    }
    '
    puts('I\m here 2')
    parsedObject = JSON.parse(sourceObject)
    expected = '{
  "large_input": {
    "success": true,
    "output": "1\n"
  }
}'
    # puts(expected)
    puts('I\m here 3')
    x = Runner.new
    y = x.run(parsedObject)
    # puts(y)
    assert_equal expected, x.run(parsedObject)
    puts('I\m here 4')

  end
end

#TestThing.srcjson
