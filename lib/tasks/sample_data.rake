namespace :db do
  desc "Fill database with sample data"
  task populate: :environment do
    make_users
    make_restaurants
    make_reservations
  end
end

def make_users
  5.times do |n|
    first_name  = "Test"
    last_name = "User #{n+1}"
    email = "test-user-#{n+1}@reservester.com"
    password  = "password"
    User.create!(first_name: first_name,
                 last_name: last_name,
                 email: email,
                 password: password,
                 password_confirmation: password)
  end
end

def make_restaurants
  users = User.all(limit: 5)
  50.times do |n|
    name = "Testaurant #{n+1}"
    street = "123 Third Street"
    city = "Cambridge"
    state = "MA"
    zip = "02141"
    phone = "012-345-6789"
    description = "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua."
    users[rand(0..4)].restaurants.create!(name: name,
                                          street: street,
                                          city: city,
                                          state: state,
                                          zip: zip,
                                          phone: phone,
                                          description: description)
  end
end

def make_reservations
  restaurants = Restaurant.all
  50.times do |n|
    email = "test@example.com"
    time = "2013-11-15 #{rand(0..23)}:09:36"
    comment = "One member of the party has peanut allergies."
    restaurants[rand(0..49)].reservations.create!(email: email,
                                                  time: time,
                                                  comment: comment)
  end
end