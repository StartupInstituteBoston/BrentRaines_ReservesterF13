namespace :db do
  desc "Fill database with sample data"
  task populate: :environment do
    make_users
    make_restaurants
    make_reservations
  end
end

def make_users
  admin = User.create!(first_name: "Brent",
                       last_name: "Raines",
                       email: "bt.raines@gmail.com",
                       password: "foobar123",
                       password_confirmation: "foobar123",
                       role: "admin")
  5.times do |n|
    first_name  = "Test"
    last_name = "User #{n+1}"
    email = "test-user-#{n+1}@reservester.com"
    password  = "password"
    role = "owner"
    User.create!(first_name: first_name,
                 last_name: last_name,
                 email: email,
                 password: password,
                 password_confirmation: password,
                 role: role)
  end
end

def make_restaurants
  users = User.all(limit: 6)
  20.times do |n|
    name = "Testaurant #{n+1}"
    street = "123 Third Street"
    city = "Cambridge"
    state = "MA"
    zip = "02141"
    phone = "012-345-6789"
    description = "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."

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
    restaurants[rand(0..19)].reservations.create!(email: email,
                                                  time: time,
                                                  comment: comment)
  end
end