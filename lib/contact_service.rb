class ContactService < Service

  def add!
    
    @contact = Hubspot::Contact.create!(@payload["email"], @payload.reject { |k,v| k == "id" })

    @contact.to_json
  end

  def update!
    @contact = Hubspot::Contact.find_by_email(@payload["email"])
    @contact.update!(@payload.reject { |k,v| k == "id" })

    @contact.to_json
  end
end