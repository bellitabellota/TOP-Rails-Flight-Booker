require "rails_helper"

RSpec.describe "Display search results", type: :system do
  context "search parameters for available flights are chosen" do
    it "displays the available flights" do
      flight = create(:flight)
      @flight_selection = [ flight ]

      visit root_path
      click_on "Search"

      expect(page).to have_content(@flight_selection.first.departure_airport.location)
    end
  end

  context "search parameters without available flights are chosen" do
    it "displays the 'no flights found' message" do
      create(:flight)
      create(:flight2)

      visit root_path

      select "MyLocation", from: "departure_airport"
      select "Paris", from: "arrival_airport"
      select "06/10/2025", from: "flight_date"

      click_on "Search"

      expect(page).to have_content("There are no flights for your search.")
    end
  end
end
