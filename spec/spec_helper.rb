require 'rubygems'
require 'bundler'

Bundler.require(:default, :test)

require File.join(File.dirname(__FILE__), '..', 'hubspot_endpoint')

Dir[File.join(File.dirname(__FILE__), 'support', '**/*.rb')].each { |f| require f }

require 'spree/testing_support/controllers'
require 'webmock/rspec'

ENV['HUBSPOT_API_KEY'] ||= 'secret'

VCR.configure do |c|
  c.allow_http_connections_when_no_cassette = true
  c.cassette_library_dir = 'spec/cassettes'
  c.hook_into :webmock

  c.filter_sensitive_data("HUBSPOT_API_KEY") { ENV["HUBSPOT_API_KEY"] }
end

Sinatra::Base.environment = 'test'

RSpec.configure do |config|
  config.include Rack::Test::Methods
  config.include Spree::TestingSupport::Controllers
  #config.include WebStubs
end