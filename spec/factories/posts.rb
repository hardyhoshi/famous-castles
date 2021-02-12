FactoryBot.define do
  factory :post do
    name     {Faker::Lorem.sentence}
    body     {Faker::Lorem.sentence}
    image_id {Faker::Lorem.sentence}
    association :user
  end
end
