require 'rails_helper'

RSpec.describe Customer, type: :model do
  it 'will make a customer from factory bot' do 
    customer = create(:customer)
    expect(customer.first_name).to be_a(String)
    expect(customer.last_name).to be_a(String)
    expect(customer.email).to be_a(String)
    expect(customer.address).to be_a(String)
  end
end
