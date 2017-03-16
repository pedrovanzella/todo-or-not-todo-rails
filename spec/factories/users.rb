FactoryGirl.define do
  factory :user do
    email { Faker::Internet.email }
    password { 'password123' }
    password_confirmation { 'password123' }
    full_name { Faker::HarryPotter.character }
  end
end
