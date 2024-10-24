class BookingsController < ApplicationController
  def new
    @selected_flight =  Flight.find(params[:flight])
    @selected_number_passengers = params[:passenger_number].to_i
    @booking = Booking.new()
    @selected_number_passengers.times { @booking.passengers.build }###
  end

  def create
    @booking = Booking.new(passenger_params)

    if @booking.save
      redirect_to booking_path(@booking)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @booking = Booking.find(params[:id])
  end

  private

  def passenger_params
    params.require(:booking).permit(:number_passengers, :flight_id, passengers_attributes: [ :name, :email ])
  end
end
