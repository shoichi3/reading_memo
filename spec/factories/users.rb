FactoryBot.define do
  factory :user do
    name                    { '山田太郎' }
    email                   { Faker::Internet.free_email }
    password                { 'tnamry3ye' }
    password_confirmation   { password }
  end
end
