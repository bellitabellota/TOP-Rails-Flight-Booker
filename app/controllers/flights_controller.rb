class FlightsController < ApplicationController
  def index
    @airport_options = Airport.all.map { |a| [ a.location, a.id ] }
    @flight_selection = Flight.where(departure_airport_id: params[:departure_airport]).where(arrival_airport_id: params[:arrival_airport])
  end
end
