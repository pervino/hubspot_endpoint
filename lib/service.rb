class Service
  def initialize(payload, config)
    @payload, @config = payload, config
    authenticate
  end

  private

  def contact
    return @payload['contact']
  end

  def authenticate
    Hubspot.configure(hapikey: api_key)
  end

  def api_key
    @config['api_key']
  end
end