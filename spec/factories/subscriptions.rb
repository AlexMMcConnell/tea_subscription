FactoryBot.define do
  factory :subscription do
    title { Faker::Lorem.words(number: 2) }
    customer
    tea
  end
end
