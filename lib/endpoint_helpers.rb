module EndpointHelpers

  def add_contact
    puts @payload
    message = ContactService.new(@payload["contact"], @config)
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
      puts "FAIL FAIL FAIL FAIL FAIL FAIL FAIL FAIL FAIL FAIL FAIL FAIL "
      puts "FAIL FAIL FAIL FAIL FAIL FAIL FAIL FAIL FAIL FAIL FAIL FAIL "
      puts "FAIL FAIL FAIL FAIL FAIL FAIL FAIL FAIL FAIL FAIL FAIL FAIL "
      if e.message.include? "Contact already exists" # && e.message.include? "CONTACT_EXISTS"
        result 500, { "customer": { "id": @id, "is_existing_customer": true } }
      else
        result 500, e.message        
      end
    end
  end
end