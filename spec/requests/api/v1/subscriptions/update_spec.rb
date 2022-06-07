require 'rails_helper'

RSpec.describe 'Update subscription' do 
    it 'will update a subscriptions status' do 
        subscription = create(:subscription, status: :active)
        patch "/api/v1/subscriptions/#{subscription.id}", params: {status: :cancelled}
        parsed_response = JSON.parse(response.body, symbolize_names: true)
        expect(parsed_response[:data][:attributes][:status]).to eq('cancelled')
    end
    it 'errors if not valid status' do 
        subscription = create(:subscription, status: :active)
        patch "/api/v1/subscriptions/#{subscription.id}", params: {status: :inactive}
        parsed_response = JSON.parse(response.body, symbolize_names: true)
        expect(parsed_response[:errors]).to eq('Status not valid')
    end
end