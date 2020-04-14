module EndpointHelpers

  def add_contact
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
      if e.message.include? "Contact already exists" 
        failure_message = {"customer": { "id": @id, "is_existing_customer": true }}

        puts "FAIL FAIL FAIL FAIL FAIL FAIL FAIL FAIL FAIL FAIL FAIL FAIL "
        puts failure_message
        puts "FAIL FAIL FAIL FAIL FAIL FAIL FAIL FAIL FAIL FAIL FAIL FAIL "
        result 500, failure_message
      else
        result 500, e.message        
      end
    end
  end
end