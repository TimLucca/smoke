require 'minitest/autorun'
require_relative "runner"
require 'json'




class TestThing < MiniTest::Test
  def srcjson
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
    expected = '
    {
      "large_input": {
        "success": true,
        "output": "1\n"
      }
    }'
    expected = JSON.parse(expected)
    x = new runner
    assert_equal(runner.run(parsedObject), expected)
  end
end

x = new TestThing
x.srcjson
