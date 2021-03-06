class ContactService < Service

  def add!
    @contact = Hubspot::Contact.create!(contact[:email], contact)

    @contact.to_json
  end

  def update!
    @contact = Hubspot::Contact.find_by_email(contact[:email])
    @contact.update!(contact)

    @contact.to_json
  end
end