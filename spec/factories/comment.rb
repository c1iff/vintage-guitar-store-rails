FactoryGirl.define do
  factory :comment do
    content 'This is a comment.'
    user_id 1
    product_id 1
  end
end
