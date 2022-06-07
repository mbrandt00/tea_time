require 'rails_helper'

RSpec.describe 'create subscriptions' do 
    it 'will create a tea subscription' do 
        tea_1 = create(:tea)
        customer_1 = create(:customer)
        post '/api/v1/subscriptions', params: {tea_id: tea_1.id, customer_id: customer_1.id, title: 'new tea trial', frequency: :weekly, status: :active, price: 50.0}
        parsed_response = JSON.parse(response.body, symbolize_names: true)
        expect(parsed_response[:data]).to include(:id, :type, :attributes)
        expect(parsed_response[:data][:attributes]).to include(:title, :price, :status, :frequency, :tea, :customer)
        expect(parsed_response[:data][:attributes][:title]).to eq('new tea trial')
        expect(parsed_response[:data][:attributes][:frequency]).to eq('weekly')
        expect(parsed_response[:data][:attributes][:price]).to eq(50.0)
        expect(parsed_response[:data][:attributes][:tea][:title]).to eq(tea_1.title)
        expect(parsed_response[:data][:attributes][:customer][:first_name]).to eq(customer_1.first_name)
    end
    describe 'sad path' do 
        it 'errors if no customer' do 
            tea_1 = create(:tea)
            post '/api/v1/subscriptions', params: {tea_id: tea_1.id, title: 'new tea trial', frequency: :weekly, status: :active, price: 50.0}
            parsed_response = JSON.parse(response.body, symbolize_names: true)
        end
        it 'errors if not a valid tea' do 
            customer_1 = create(:customer)
            post '/api/v1/subscriptions', params: {customer_id: customer_1.id, title: 'new tea trial', frequency: :weekly, status: :active, price: 50.0}
            parsed_response = JSON.parse(response.body, symbolize_names: true)
            expect(parsed_response[:errors]).to eq('Tea not found')
        end
        it 'errors if not all params are passed' do 
            tea_1 = create(:tea)
            customer_1 = create(:customer)
            post '/api/v1/subscriptions', params: {tea_id: tea_1.id, customer_id: customer_1.id, title: 'new tea trial', frequency: :weekly, status: :active}
            parsed_response = JSON.parse(response.body, symbolize_names: true)
            expect(parsed_response[:errors]).to eq(["Price can't be blank"])
        end
    end
end