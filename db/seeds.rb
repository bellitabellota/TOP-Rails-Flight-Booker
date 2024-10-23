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
  [ "Frankfurt", "FRA" ],
  [ "Madrid", "MAD" ],
  [ "Vienna", "VIE" ]
]

airport_list.each do |airport|
  Airport.create(location: airport[0], code: airport[1])
end

flight_list = [
  [ "LHR", "CDG", "2025-06-07 10:00", 63 ],
  [ "LHR", "CDG", "2025-06-15 17:00", 63 ],
  [ "LHR", "CDG", "2025-06-20 22:00", 63 ],
  [ "LHR", "MAD", "2025-06-18 09:00", 134 ],
  [ "LHR", "MAD", "2025-06-20 23:00", 134 ],
  [ "LHR", "CDG", "2025-06-20 22:00", 63 ],
  [ "LHR", "FRA", "2025-06-07 10:00", 114 ],
  [ "LHR", "FRA", "2025-06-20 12:00", 114 ],
  [ "LHR", "FRA", "2025-06-27 20:00", 114 ],
  [ "LHR", "VIE", "2025-06-24 20:22", 132 ],
  [ "LHR", "VIE", "2025-06-07 07:33", 132 ],
  [ "LHR", "VIE", "2025-06-07 10:52", 132 ],
  [ "LHR", "VIE", "2025-06-07 22:52", 132 ],
  [ "CDG", "LHR", "2025-06-07 16:00", 63 ],
  [ "CDG", "LHR", "2025-06-24 13:00", 63 ],
  [ "CDG", "LHR", "2025-06-27 06:00", 63 ],
  [ "CDG", "FRA", "2025-06-27 06:00", 109 ],
  [ "CDG", "FRA", "2025-06-05 07:30", 109 ],
  [ "CDG", "FRA", "2025-06-19 17:00", 109 ],
  [ "CDG", "MAD", "2025-06-21 17:00", 118 ],
  [ "CDG", "MAD", "2025-06-03 17:00", 118 ],
  [ "CDG", "VIE", "2025-06-05 16:00", 116 ],
  [ "FRA", "CDG", "2025-06-02 10:00", 106 ],
  [ "FRA", "CDG", "2025-06-09 11:00", 106 ],
  [ "FRA", "CDG", "2025-06-15 13:00", 106 ],
  [ "FRA", "LHR", "2025-06-10 13:50", 124 ],
  [ "FRA", "LHR", "2025-06-18 15:45", 124 ],
  [ "FRA", "LHR", "2025-06-21 17:10", 124 ],
  [ "FRA", "MAD", "2025-06-29 16:10", 159 ],
  [ "FRA", "MAD", "2025-06-03 16:10", 159 ],
  [ "FRA", "VIE", "2025-06-03 16:10", 72 ],
  [ "MAD", "LHR", "2025-06-01 09:10", 134 ],
  [ "MAD", "CDG", "2025-06-04 11:10", 118 ],
  [ "MAD", "FRA", "2025-06-06 12:10", 159 ],
  [ "MAD", "VIE", "2025-06-09 03:10", 180 ],
  [ "VIE", "LHR", "2025-06-06 04:20", 132 ],
  [ "VIE", "CDG", "2025-06-09 08:20", 116 ],
  [ "VIE", "FRA", "2025-06-06 04:20", 72 ],
  [ "VIE", "MAD", "2025-06-10 10:20", 180 ]
]

flight_list.each do |flight|
  Flight.create(departure_airport_id: Airport.find_by(code: flight[0]).id, arrival_airport_id: Airport.find_by(code: flight[1]).id, start_datetime: flight[2].to_datetime, duration_minutes: flight[3])
end
