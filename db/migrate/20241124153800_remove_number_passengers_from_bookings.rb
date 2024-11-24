class RemoveNumberPassengersFromBookings < ActiveRecord::Migration[7.2]
  def change
    remove_column :bookings, :number_passengers, :integer
  end
end
