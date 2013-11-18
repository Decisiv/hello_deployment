require 'sinatra'
require 'rack/test'
require 'rspec'
require_relative '../app'

# setup test environment
set :environment, :test
set :run, false
set :raise_errors, true
set :logging, false

def app
  App
end

RSpec.configure do |config|
  config.include Rack::Test::Methods
end
