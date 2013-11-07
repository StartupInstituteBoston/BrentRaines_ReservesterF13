FactoryGirl.define do
  factory :restaurant do
    sequence(:name)   { |n| "Restaurant #{n}" }
    sequence(:street) { |n| (0+n).to_s + " Third Street" }
    city "Cambridge"
    state "MA"
    zip "02141"
    phone "012-345-6789"
    description "Lorem ipsum"
  end

  factory :photo do
    photo Rack::Test::UploadedFile.new(File.open(File.join(Rails.root, '/spec/fixtures/myfiles/test_photo.jpg')))
  end
end
