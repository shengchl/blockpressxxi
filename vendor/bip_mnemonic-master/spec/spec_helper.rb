require 'simplecov'
SimpleCov.start

require 'codecov'
SimpleCov.formatter = SimpleCov::Formatter::Codecov

Dir[File.join(File.dirname(__FILE__), '..', 'lib', '*.rb')].each { |f| require f }
