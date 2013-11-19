require 'sinatra/base'
require 'json'

class App < Sinatra::Base
  get '/' do
    "Hello #{ENV.fetch('APP_ENV') { "Deployment"}}!"
  end

  get '/health.:type' do |type|
    @healthy = rand > 0.5 ? true : false
    case type
    when 'json'
      content_type :json
      { :healthy => @healthy }.to_json
    else
      "Health: #{@healthy}"
    end
  end
end
