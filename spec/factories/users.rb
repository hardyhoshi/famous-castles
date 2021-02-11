FactoryBot.define do
  factory :user do
    email                 { Faker::Internet.free_email }
    password              { '1aaaaa' }
    password_confirmation { password }
    nickname              { Faker::Name.initials }
  end
end
