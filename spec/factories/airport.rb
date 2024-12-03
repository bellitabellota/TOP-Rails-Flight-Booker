FactoryBot.define do
  factory :departure_airport, class: "Airport" do
    location { "MyLocation" }
    code { "MLC" }
  end

  factory :departure_airport2, class: "Airport" do
    location { "AnotherLocation" }
    code { "ALC" }
  end

  factory :arrival_airport, class: "Airport" do
    location { "London" }
    code { "LDN" }
  end

  factory :arrival_airport2, class: "Airport" do
    location { "Paris" }
    code { "CDG" }
  end
end
