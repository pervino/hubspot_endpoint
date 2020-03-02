module EndpointHelpers

  def add_contact
    message = ContactService.new(@payload, @config)
    message.add!
  end

  def update_contact
    message = ContactService.new(@payload, @config)
    message.update!
  end

  def process_request
    begin
      yield
    rescue Hubspot::RequestError => e
      puts e.message
      if e.message == "Contact already exists"
        result 200, e.message
      else
        result 500, e.message        
      end
    end
  end
end