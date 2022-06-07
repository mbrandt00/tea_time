require 'rails_helper'

RSpec.describe 'Create teas' do 
    it 'will create a tea' do 
        post '/api/v1/teas', params: {
                                title: 'Green Tea',
                                description: 'Our best seller!',
                                temperature: 90,
                                brew_time: 60
        }
        expect(response.status).to eq(201)
        parsed_response = JSON.parse(response.body, symbolize_names: true)
        expect(parsed_response[:data]).to include(:id, :type, :attributes)
        expect(parsed_response[:data][:attributes]).to include(:title, :description, :temperature, :brew_time)
        expect(parsed_response[:data][:attributes][:title]).to eq('Green Tea')
        expect(parsed_response[:data][:attributes][:description]).to eq('Our best seller!')
        expect(parsed_response[:data][:attributes][:temperature]).to eq(90)
        expect(parsed_response[:data][:attributes][:brew_time]).to eq(60)
    end
    it 'will have a sad path' do 
        post '/api/v1/teas', params: {brew_time: 60}
        parsed_response = JSON.parse(response.body, symbolize_names: true)
        expect(parsed_response[:errors]).to eq(["Title can't be blank"])
    end
end