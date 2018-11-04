require 'minitest/autorun'
# require 'diffy'
require_relative '../test'
# require_relative 'runner'
# require 'json'

# comment
class RunnerTest < Minitest::Test

  def setup
    @x = SimpleClass.new
  end
  puts(@x.out)
  # def test_get_true_response
  #   # assert_equal 'Hello!', puts('Hello!')
  #   assert_equal'Hello!', 'hello'
  #   # assert_equal'Hello!', @test.out
  # end

end