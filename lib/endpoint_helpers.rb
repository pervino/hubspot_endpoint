module EndpointHelpers

  def add_contact
    message = ContactService.new(@payload["contact"], @config)
    message.add!
  end

  def update_contact
    puts @payload
    message = ContactService.new(@payload["contact"], @config)
    message.update!
  end

  def process_request
    begin
      yield
    rescue Hubspot::RequestError => e
      if e.message.include? "Contact already exists" 
        result 200, "Customer Already Exists"
      else
        result 500, e.message        
      end
    end
  end
end