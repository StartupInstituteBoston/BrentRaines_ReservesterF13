FactoryGirl.define do

  factory :restaurant do
    sequence(:name)   { |n| "Restaurant #{n}" }
    sequence(:street) { |n| (0+n).to_s + " Third Street" }
    city "Cambridge"
    state "MA"
    zip "02141"
    phone "012-345-6789"
    description "Lorem ipsum"
    user
  end

  factory :user do
    first_name "Test"
    sequence(:last_name) { |n| "User #{n}" }
    sequence(:email)  { |n| "test_user#{n}@example.com" }
    password "foobar123"
    role "owner"
  end
end
