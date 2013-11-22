require 'sinatra/base'
require 'haml'
require 'thin'
require 'json'
require_relative 'lib/receiver'
require_relative 'lib/configuration'

class App < Sinatra::Base
  get '/' do
    "Hello #{ENV.fetch('APP_ENV') { "Deployment"}}!"
  end

  post "/receive" do
    message = params.fetch(:message) { "empty message" }
    # record message
  end

  # POSTs to receiving application
  get "/send" do
    haml(:send)
  end

  post "/send" do
    message = params[:message]
    notify(message)
  end

  get '/health.:type' do |type|
    @healthy = rand > 0.5 ? true : false
    notify("I have been health-checked!")
    case type
    when 'json'
      content_type :json
      { :healthy => @healthy }.to_json
    else
      "Health: #{@healthy}"
    end
  end

  private

  def notify(message)
    if receiver.notify(message)
      # record message
    end
  end

  def receiver
    @receiver ||= Receiver.new(config.receiver_url)
  end

  def config
    @config ||= Configuration.new
  end
end
