FactoryGirl.define do
  factory :authentication_token do
    user_id ""
    token Faker::Lorem.characters
  end
end
