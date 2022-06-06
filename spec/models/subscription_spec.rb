require 'rails_helper'

RSpec.describe Subscription, type: :model do
  it 'will create a subscription from factory_bot' do 
    subscription = create(:subscription)
    expect(subscription.title).to be_a(String)
    expect(subscription.price).to be_a(Float)
    expect(subscription.status).to be_a(String)
    expect(subscription.frequency).to be_a(String)
    expect(subscription.customer).to be_a(Customer)
    expect(subscription.tea).to be_a(Tea)
  end
end
