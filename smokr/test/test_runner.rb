require 'minitest/autorun'
require_relative '../runner'
require 'json'

require 'simplecov'
SimpleCov.start

require 'codecov'
SimpleCov.formatter = SimpleCov::Formatter::Codecov

class TestThing < MiniTest::Test
  def test_runner
    source = {
        "tests" => [
            {
                "output" => "MQo=",
                "name" => "Large Input",
                "input" => "NQoxIDIgLTIgMjU3IC0zCg=="
            }
        ],
        "command" => "ruby test.rb",
        "code" => "cCBbKiQ8XVsxXS5zcGxpdC5taW5fYnl7fGx8dj1sLnRvX2k7dioqNC12fS50b19p",
        "file" => "test.rb"
    }

    expected = {
        "large_input" => {
            "success" => true,
            "output" => "1\n"
        }
    }
    actual = JSON.parse Runner.run(source)
    assert_equal actual, expected
    assert(actual == expected)
    assert(actual != nil)
  end
end