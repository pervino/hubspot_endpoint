class ContactService < Service

  def add!
    
    @contact = Hubspot::Contact.create!(@payload["email"], @payload.reject { |k,v| k == "id" })

    @contact.to_json
  end

  def update!
    @contact = Hubspot::Contact.find_by_email(@payload["email"])

    # if customer has changed their email, we'll just make a new contact
    if @contact == nil
      @contact = Hubspot::Contact.create!(@payload["email"], @payload.reject { |k,v| k == "id" })
    else
      @contact.update!(@payload.reject { |k,v| k == "id" })
    end

    @contact.to_json
  end
end