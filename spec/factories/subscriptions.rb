FactoryBot.define do
  factory :subscription do
    title { Faker::Lorem.words(number: 2) }
    active { true }
    frequency { Faker::Subscription.payment_term }
    customer
    tea
  end
end
