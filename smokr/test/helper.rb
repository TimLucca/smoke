require 'simplecov'
SimpleCov.start do
  track_files 'test/test_*.rb'
end

require 'codecov'
SimpleCov.formatter = SimpleCov::Formatter::Codecov

require_relative 'test_runner'