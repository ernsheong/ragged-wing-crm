FactoryGirl.define do
  factory :user do
    email "this is an email"
    identifier_url "this is an url"
    admin true
  end
end