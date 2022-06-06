FactoryBot.define do
  factory :tea do
    title { Faker::Tea.variety }
    description { Faker::Lorem.sentence(word_count: 3) }
    temperature { rand(70..90)}
    brew_time { rand(30..90) }
  end
end
