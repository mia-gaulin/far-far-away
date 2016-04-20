FactoryGirl.define do
  factory :user do
    first_name "Anakin"
    last_name "Skywalker"
    sequence(:email) { |n| "skywalker#{n}@jeditemple.gov" }
    password "password"
  end
end
