# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
airports =  [ { code: "Cai", name: "Cairo International Airport" }, { code: "DXB", name: "Dubai International Airport" },
{ code: "HND", name: "Tokyo Haneda Airport" }, { code: "LHR", name: "London Heathrow Airport" } ]

airports.each do |airport|
  Airport.find_or_create_by!(airport)
end

airports_ids = Airport.limit(4).ids

airports_ids.each_with_index do |id, index|
  second_id = airports_ids[index + 1].nil? ? airports_ids[0] : airports_ids[index + 1]
  4.times do |i|
    Flight.find_or_create_by!({ arrival_airport_id: id, departure_airport_id: second_id, date: Date.today + i.days, duration: "#{i + 2} hours" })
    Flight.find_or_create_by!({ arrival_airport_id: second_id, departure_airport_id: id, date: Date.today + i.days, duration: "#{i + 2} hours" })
  end
end
