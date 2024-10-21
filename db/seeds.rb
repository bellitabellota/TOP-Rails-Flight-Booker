# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

airport_list = [
  [ "London", "LHR" ],
  [ "Paris", "CDG" ],
  [ "Frankfurt", "FRA" ]
]

airport_list.each do |airport|
  Airport.create(location: airport[0], code: airport[1])
end

flight_list = [
  [ "LHR", "CDG", "2025-06-07 10:00", 63 ],
  [ "LHR", "CDG", "2025-06-15 17:00", 63 ],
  [ "LHR", "CDG", "2025-06-20 22:00", 63 ],
  [ "LHR", "FRA", "2025-06-07 10:00", 114 ],
  [ "LHR", "FRA", "2025-06-20 12:00", 114 ],
  [ "LHR", "FRA", "2025-06-27 20:00", 114 ],
  [ "CDG", "LHR", "2025-06-07 16:00", 63 ],
  [ "CDG", "LHR", "2025-06-24 13:00", 63 ],
  [ "CDG", "LHR", "2025-06-27 06:00", 63 ],
  [ "CDG", "FRA", "2025-06-27 06:00", 109 ],
  [ "CDG", "FRA", "2025-06-05 07:30", 109 ],
  [ "CDG", "FRA", "2025-06-19 17:00", 109 ],
  [ "FRA", "CDG", "2025-06-02 10:00", 106 ],
  [ "FRA", "CDG", "2025-06-09 11:00", 106 ],
  [ "FRA", "CDG", "2025-06-15 13:00", 106 ],
  [ "FRA", "LHR", "2025-06-10 13:50", 124 ],
  [ "FRA", "LHR", "2025-06-18 15:45", 124 ],
  [ "FRA", "LHR", "2025-06-23 16:10", 124 ]
]

flight_list.each do |flight|
  Flight.create(departure_airport_id: Airport.find_by(code: flight[0]).id, arrival_airport_id: Airport.find_by(code: flight[1]).id, start_datetime: flight[2].to_datetime, duration_minutes: flight[3])
end
