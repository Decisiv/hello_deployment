require "net/http"
require "uri"

class Receiver
  def initialize(receiver_url)
    @receiver_url = receiver_url
  end

  # Fire and forget
  def notify(message)
    Net::HTTP.post_form(uri, message: message)
  end

  private
  attr_reader :receiver_url

  def uri
    @uri ||= URI.parse(receiver_url)
  end
end
