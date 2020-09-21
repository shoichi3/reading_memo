FactoryBot.define do
  factory :memo do
    memo      { Faker::Lorem.characters(number: 40) }
    association :user
    association :book
  end
end
