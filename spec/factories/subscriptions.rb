FactoryBot.define do
  factory :subscription do
    title { "Subscription Name" }
    price { rand(5..20) }
    status { [:active, :cancelled].sample }
    frequency { [:weekly, :monthly, :quarterly, :yearly].sample }
    customer
    tea
  end
end
