require_relative 'helper'
require 'minitest/autorun'
require_relative '../runner'
require 'json'


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
    assert_equal expected, actual
    assert(actual == expected)
    assert(actual != nil)
  end

  def test_python
    source =
    {
        "tests" => [
        {
          "output" => "MQo=",
          "name" => "Should Pass",
          "input" => "NQ=="
        },
        {
            "output"=> "LTEK",
            "name"=> "Should Pass 2",
            "input"=> "Mw=="
        },
        {
            "output" => "MQo=",
            "name" => "Should Fail",
            "input" => "Mw=="
        }
    ],
        "command" => "python3 test.py",
        "code" => "eCA9IGludChpbnB1dCgpKQp5ID0geCAtIDQKcHJpbnQoeSk=",
        "file" => "test.py"
    }

    expected = {
        "should_pass"=> {
            "success"=> true,
            "output"=> "1\n"
        },
        "should_pass2"=> {
            "success"=> true,
            "output"=> "-1\n"
        },
        "should_fail"=> {
            "success"=> false,
            "actual"=> "-1\n",
            "expected"=> "1\n",
            "difference"=> "--1\n+1\n"
        }
    }
    actual = JSON.parse Runner.run(source)
    assert_equal expected, actual
    assert(actual != nil)
  end
end

