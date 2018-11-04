require 'json'
require_relative 'runner'
puts Runner.run JSON.parse STDIN.read