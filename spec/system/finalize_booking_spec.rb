require "rails_helper"

RSpec.describe "Finalize Booking", type: :system do
  context "booking a flight option with 2 passengers" do
    it "displays booking confirmation" do
      flight = create(:flight)
      @flight_selection = [ flight ]
      create(:flight2)

      visit root_path

      select "MyLocation", from: "departure_airport"
      select "London", from: "arrival_airport"
      select "06/10/2025", from: "flight_date"
      select 2, from: "passenger_number"

      click_on "Search"


      choose("Select flight")
      click_on "Book flight"

      fill_in "booking_passengers_attributes_0_name", with: "John"
      fill_in "booking_passengers_attributes_0_email", with: "john@email.com"
      fill_in "booking_passengers_attributes_1_name", with: "Alice"
      fill_in "booking_passengers_attributes_1_email", with: "alice@email.com"
      click_on "Finalize Booking"

      expect(page).to have_content("Booking confirmation")
    end
  end
end
