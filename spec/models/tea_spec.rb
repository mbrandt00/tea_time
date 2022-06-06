require 'rails_helper'

RSpec.describe Tea, type: :model do
  it 'will make a tea from factory bot' do 
    a = create(:tea) 
    expect(a.title).to be_a(String)
    expect(a.description).to be_a(String)
    expect(a.temperature).to be_a(Integer)
    expect(a.brew_time).to be_a(Integer)
  end
end