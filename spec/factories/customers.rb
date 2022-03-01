FactoryBot.define do
  factory :customer do
    name { Faker::Name.name }
    email { Faker::Name.first_name + "@gmail.com" }
    address { Faker::Address.full_address }
  end
end
