FactoryBot.define do
  factory :subscription do
    title { "MyString" }
    price { 1.5 }
    status { "" }
    frequency { "" }
    customer { nil }
    tea { nil }
  end
end
