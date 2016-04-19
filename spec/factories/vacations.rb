FactoryGirl.define do
  factory :vacation do
    start_date "2017-04-19"
    end_date "2017-04-26"
    num_of_people "3"
    vacationer "Anakin Skywalker"

    planet
  end
end
