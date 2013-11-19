require 'sinatra/base'

class App < Sinatra::Base
  get '/' do
    "Hello #{ENV['APP_ENV']}!"
  end
end
