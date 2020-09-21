FactoryBot.define do
  factory :book do
    title     { Faker::Lorem.characters(number: 10) }
    association :user
  end
end
