require_relative 'test_2'
require 'minitest/autorun'
# require 'diffy'

# require_relative 'runner'
# require 'json'

# comment
class RunnerTest < Minitest::Test

  # def setup
  #   @@x = SimpleClass2.new
  #   @@x = @@x.out_2
  # end
  # @x = SimpleClass2.new
  # puts(@@x.out_2)
  def test_get_true_response
    x = SimpleClass2.new
    puts(x.out_2)
    # assert_equal 'Hello!', puts('Hello!')
    assert(x.out_2 == 'Hello!', 'out_2 did not equal Hello!' )
    assert_equal'Hello!', x.out_2
    # assert_equal'Hello!', @test.out
  end

end