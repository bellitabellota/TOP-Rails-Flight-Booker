require "rails_helper"

RSpec.describe "Finalize Booking", type: :system do
  context "booking a flight option with 2 passengers" do
    it "displays booking confirmation" do
      flight = create(:flight)

      visit new_booking_path(flight: flight, passenger_number: 2)

      fill_in "booking_passengers_attributes_0_name", with: "John"
      fill_in "booking_passengers_attributes_0_email", with: "john@email.com"
      fill_in "booking_passengers_attributes_1_name", with: "Alice"
      fill_in "booking_passengers_attributes_1_email", with: "alice@email.com"
      click_on "Finalize Booking"

      expect(page).to have_content("Booking confirmation")
    end
  end
end
