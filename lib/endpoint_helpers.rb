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
      if e.message.include? "Contact already exists" # && e.message.include? "CONTACT_EXISTS"
        result 200, "Contact already exists"
      else
        result 500, e.message        
      end
    end
  end
end