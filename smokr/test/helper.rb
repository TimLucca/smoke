require 'simplecov'
SimpleCov.start

require 'codecov'
SimpleCov.formatter = SimpleCov::Formatter::Codecov

require 'test_runner'
require 'test/unit'

class Test::Unit::TestCase
end