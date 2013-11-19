FactoryGirl.define do
  factory :reservation do
    email "test@example.com"
    time "2013-11-15 16:09:36"
    comment "One member of the party has peanut allergies."
    restaurant_id 1
  end
end
