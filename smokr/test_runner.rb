require 'minitest/autorun'
require_relative 'runner'
#require 'json'





class TestThing < MiniTest::Test
  def test_selfsrcjson

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

    parsedObject = JSON.parse(sourceObject)
    expected = '{
  "large_input": {
    "success": true,
    "output": "1\n"
  }
}'
    # puts(expected) # debugging

    x = Runner.new
    # y = x.run(parsedObject) # debugging
    # puts(y)                 # debugging
    assert_equal expected, x.run(parsedObject)


  end
end

#TestThing.srcjson
