FactoryGirl.define do
  factory :user do
    email 'new_user@test.com'
    user_name 'testUser'
    password 'password'
    admin true
  end
end
