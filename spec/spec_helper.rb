# frozen_string_literal: true

require_relative './setup_test_database'

# Sinatra needs to know what environment it is running on
# It takes the environment from the RACK_ENV environment variable.
# Here we specify the environment as 'test'
ENV['RACK_ENV'] = 'test'

# Set to test environment
ENV['ENVIRONMENT'] = 'test'

RSpec.configure do |config|
  config.before(:each) do
    setup_test_database
  end
end

require File.join(File.dirname(__FILE__), '..', 'app.rb')

require 'capybara/rspec'
require 'simplecov'
require 'simplecov-console'
require 'rubocop'

Capybara.app = BookmarkManager

SimpleCov.formatter = SimpleCov::Formatter::MultiFormatter.new(
  [SimpleCov::Formatter::Console, SimpleCov::Formatter::HTMLFormatter]
)
SimpleCov.start
