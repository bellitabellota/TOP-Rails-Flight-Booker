require "rails_helper"

RSpec.describe "Finalize Booking", type: :system do
  context "booking a flight option with 2 passengers" do
    before do
      flight = create(:flight)

      visit new_booking_path(flight: flight, passenger_number: 2)

      fill_in "booking_passengers_attributes_0_name", with: "John"
      fill_in "booking_passengers_attributes_0_email", with: "john@email.com"
      fill_in "booking_passengers_attributes_1_name", with: "Alice"
      fill_in "booking_passengers_attributes_1_email", with: "alice@email.com"
      click_on "Finalize Booking"
    end

    it "displays booking confirmation" do
      expect(page).to have_content("Booking confirmation")
    end

    it "displays the departure airport of the flight associated with the booking" do
      expect(page).to have_content("MyLocation")
    end

    it "displays the passenger names associated with the booking" do
      expect(page).to have_content("John")
      expect(page).to have_content("Alice")
    end
  end
end
