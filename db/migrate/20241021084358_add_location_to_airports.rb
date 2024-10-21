class AddLocationToAirports < ActiveRecord::Migration[7.2]
  def change
    add_column :airports, :location, :string
  end
end
