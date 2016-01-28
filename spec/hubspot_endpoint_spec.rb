require 'spec_helper'

describe HubspotEndpoint do
  let(:contact_payload) { FactoryRequests.contact }
  let(:contact_posted_successfully) { FactoryResponses.shipment_posted_successfully }
  let(:contact) { FactoryResponses.contact }

  let(:config) do
    {
        parameters: {
            api_key: ENV['HUBSPOT_API_KEY'],
            access_token: ENV['HUBSPOT_ACCESS_TOKEN']
        }
    }
  end

  context "POST :add_contact" do
    it "returns success" do
      message = {
          contact: {
              email: 'anthony@personalwine.com',
              average_total_per_order: '27.94'
          }
      }.merge! config

      post '/add_contact', message.to_json
      expect(json_response[:summary]).to match 'Successfully sent contact to Hubspot'
      expect(last_response.status).to eq 200
    end
  end

  context "POST :add_contact" do
    it "returns success" do
      message = {
          contact: {
              email: 'anthony@personalwine.com',
              average_total_per_order: '28.94'
          }
      }.merge! config

      post '/add_contact', message.to_json
      expect(json_response[:summary]).to match 'Successfully updated contact in Hubspot'
      expect(last_response.status).to eq 200
    end
  end
end