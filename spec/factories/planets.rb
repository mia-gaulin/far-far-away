FactoryGirl.define do
  factory :planet do
    sequence(:name) { |n| "Tatooine#{n}" }
    language "Basic, Bocce, Huttese, Jawaese, Tusken"
    sector "Arkanis"
    region "Outer Rim Territories"
    description "Herp derp"
  end
end
