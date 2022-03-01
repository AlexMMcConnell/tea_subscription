FactoryBot.define do
  factory :tea do
    name: { Faker::Tea.variety }
    description: { Faker::Lorem.sentence }
    temperature: { Faker::Number.number(digits: 2).to_s + " C" }
    brew_time: { Faker::Number.number(digits: 2) }

  end
end
