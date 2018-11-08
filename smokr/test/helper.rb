require 'simplecov'
SimpleCov.start do
  track_files ['runner.rb']
end

require 'codecov'
SimpleCov.formatter = SimpleCov::Formatter::Codecov

require_relative 'test_runner'