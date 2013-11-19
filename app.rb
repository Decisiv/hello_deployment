require 'sinatra/base'

class App < Sinatra::Base
  get '/' do
    "Hello #{ENV.fetch('APP_ENV') { "Deployment"}}!"
  end
end
