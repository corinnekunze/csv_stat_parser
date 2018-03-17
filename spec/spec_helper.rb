require 'bundler/setup'
require 'csv_stat_parser'
require 'pry'
require 'simplecov'

SimpleCov.start

Dir[File.dirname(__FILE__) + '/shared/examples/*.rb'].each {|file| require file }

RSpec.configure do |config|
  # Enable flags like --only-failures and --next-failure
  config.example_status_persistence_file_path = '.rspec_status'

  config.expect_with :rspec do |c|
    c.syntax = :expect
  end
end
