require 'minitest/autorun'
require_relative '../runner'
require 'json'

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
    runner = Runner.new
    assert_equal expected, runner.run(parsedObject)
    assert(runner.run(parsedObject) == expected)
    assert(runner.run(parsedObject) != nil)
  end
end

