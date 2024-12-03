require "rails_helper"

RSpec.describe "Flight model" do
  context "start_dateime is present" do
    it "can be saved" do
      flight = build(:flight)
      expect(flight.save).to be true
    end
  end

  context "start_dateime is NOT present" do
    it "can NOT be saved" do
      flight = build(:flight, start_datetime: nil)
      expect(flight.save).to be false
    end
  end

  context "duration_minutes is NOT present" do
    it "can NOT be saved" do
      flight = build(:flight, duration_minutes: nil)
      expect(flight.save).to be false
    end
  end
end
