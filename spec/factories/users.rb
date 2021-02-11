FactoryBot.define do
  factory :user do
    email                 {'test@example'}
    password              {'1a1a1a'}
    password_confirmation {password}
    nickname              {'test'}
  end
end