source 'https://rubygems.org'

ruby '2.6.5'

gem 'sinatra'
gem 'tilt'
gem 'tilt-jbuilder', require: 'sinatra/jbuilder'

gem 'endpoint_base', github: 'spree/endpoint_base'
gem 'hubspot-ruby'

group :production do
  gem 'unicorn'
end

group :development, :test do
  gem 'rspec'
  gem 'vcr'
end

group :test do
  gem 'pry'
  gem 'webmock'
  gem 'rack-test'
end