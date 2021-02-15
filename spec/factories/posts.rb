FactoryBot.define do
  factory :post do
    name     { Faker::Lorem.sentence }
    body     { Faker::Lorem.sentence }
    image_id { 123_456 }
    association :user
  end
end
