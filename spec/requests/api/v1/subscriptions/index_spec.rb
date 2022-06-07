require 'rails_helper'

RSpec.describe 'Subscription Index' do 
    it 'will show all the subscriptions that a customer has' do 
        customer_1 = create(:customer)
        subscriptions = FactoryBot.create_list(:subscription, 10, customer_id: customer_1.id)
        get '/api/v1/subscriptions', params: {customer_id: customer_1.id}
        parsed_response = JSON.parse(response.body, symbolize_names: true)
        expect(parsed_response[:data].length).to eq(10)
    end
end