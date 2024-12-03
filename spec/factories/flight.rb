FactoryBot.define do
  factory :flight do
    departure_airport
    arrival_airport
     start_datetime { "2025-10-06 04:20" }
    duration_minutes { 132 }
  end

  factory :flight2, class: "Flight" do
    departure_airport { association :departure_airport2 }
    arrival_airport { association :arrival_airport2 }
    start_datetime { "2025-06-07 04:20" }
    duration_minutes { 140 }
  end
end
