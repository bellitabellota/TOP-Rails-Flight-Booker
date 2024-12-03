require "rails_helper"

RSpec.describe "Selecting flight displays bookings#new", type: :system do
  context "a flight option with 2 passengers is selected, bookings#new is displayed" do
    it "has two fieldsets with class:'passenger-details'" do
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
      expect(page).to have_css(".passenger-details").twice
    end
  end
end
