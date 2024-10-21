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
  [ "Amsterdam", "AMS" ],
  [ "Madrid", "MAD" ],
  [ "Barcelona", "BCN" ],
  [ "Munich", "MUC" ],
  [ "Rom", "FCO" ],
  [ "Dublin", "DUB" ],
  [ "Vienna", "VIE" ],
  [ "Manchester", "MAN" ],
  [ "Palma de Mallorca", "PMI" ],
  [ "Oslo", "OSL" ],
  [ "Istanbul", "IST" ],
  [ "Stockholm", "ARN" ],
  [ "Copenhagen", "CPH" ]
]

airport_list.each do |airport|
  Airport.create(location: airport[0], code: airport[1])
end
