require 'rails_helper'

RSpec.describe 'Make a customer' do 
    it 'makes a customer' do 
        post '/api/v1/customers', params: {first_name: 'Michael', 
                                            last_name:'Brandt', 
                                            email: 'michael@yahoo.com', 
                                            address: '100 Broadway'}
        parsed_response = JSON.parse(response.body, symbolize_names: true)
        expect(parsed_response[:data]).to include(:id, :type, :attributes)
        expect(parsed_response[:data][:attributes]).to include(:first_name, :last_name, :email, :address)
        expect(parsed_response[:data][:attributes][:first_name]).to eq('Michael')
        expect(parsed_response[:data][:attributes][:last_name]).to eq('Brandt')
        expect(parsed_response[:data][:attributes][:email]).to eq('michael@yahoo.com')
        expect(parsed_response[:data][:attributes][:address]).to eq('100 Broadway')
    end
    it 'has a sad path if not all attributes are present' do 
        post '/api/v1/customers', params: {first_name: 'Michael'}
        expect(response.status).to eq(400)
        parsed_response = JSON.parse(response.body, symbolize_names: true)
        expect(parsed_response[:error]).to eq(["Last name can't be blank", "Address can't be blank", "Email can't be blank"])
    end
end