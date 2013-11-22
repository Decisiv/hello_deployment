class Configuration
  def initialize(config_source = ENV)
    @config_source = config_source
  end

  def receiver_url
    config_source.fetch("RECEIVER_URL")
  end

  private
  attr_reader :config_source
end
