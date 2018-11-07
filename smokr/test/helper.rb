require 'simplecov'
SimpleCov.start

require 'codecov'
SimpleCov.formatter = SimpleCov::Formatter::Codecov

require_relative './test_runner'
require 'test/unit'

class Test::Unit::TestCase
end