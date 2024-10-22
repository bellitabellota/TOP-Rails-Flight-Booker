class FlightsController < ApplicationController
  def index
    @airport_options = Airport.all.map { |a| [ a.location ] }
    @flight_dates = Flight.all.map { |f| [ f.start_datetime.to_date.strftime("%d/%m/%Y") ] }.uniq

    if params.include?("departure_airport")
        @selected_departure_airport = Airport.find_by(location: params[:departure_airport])
        @selected_arrival_airport = Airport.find_by(location: params[:arrival_airport])
        @flight_selection = Flight.where(departure_airport_id: @selected_departure_airport.id)
                                  .where(arrival_airport_id: @selected_arrival_airport.id)
                                  .where(start_datetime: params[:flight_date].to_date.beginning_of_day..params[:flight_date].to_date.end_of_day)
    end
  end
end
