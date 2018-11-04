require 'minitest/autorun'

# test class
class SimpleClass
  def out
    'Hello!'
  end
end

# comment
class SimpleTest < Minitest::Test
  def setup
    @y = SimpleClass.new
  end

  def test_hello
    assert_equal 'Hello!', @y.out
  end
end