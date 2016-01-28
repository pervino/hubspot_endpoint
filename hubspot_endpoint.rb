# Sinatra
require 'sinatra'

# Hash fix
require 'active_support/core_ext/hash'

require 'endpoint_base'

require 'hubspot-ruby'

require './lib/endpoint_helpers'
require './lib/service'
require './lib/contact_service'

class HubspotEndpoint < EndpointBase::Sinatra::Base
  endpoint_key ENV["ENDPOINT_KEY"]
  helpers EndpointHelpers
  set :logging, true

  post '/add_contact' do
    process_request do
      add_contact
      result 200, 'Successfully sent contact to Hubspot'
    end
  end

  post '/update_contact' do
    process_request do
      update_contact
      result 200, 'Successfully updated contact in Hubspot'
    end
  end

  post '/ping' do
    result 200, "Hi! Time now is: #{Time.new}"
  end
end