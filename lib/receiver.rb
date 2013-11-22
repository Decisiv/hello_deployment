require "net/http"
require "uri"

class Receiver
  def initialize(receiver_url)
    @receiver_url = receiver_url
  end

  # Fire and forget
  def notify(message)
    response = Net::HTTP.post_form(uri, message: message)
    response.code == 200 ? true : false
  end

  private
  attr_reader :receiver_url

  def uri
    @uri ||= URI.parse(receiver_url)
  end
end
