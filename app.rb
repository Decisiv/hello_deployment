require 'sinatra/base'

class App < Sinatra::Base
  get '/' do
    "Hello Deployment!"
  end
end
