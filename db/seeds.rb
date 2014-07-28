# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# # Will want to later set up this seed process a recurring weekly check -- and ideally write ONLY new rows
# collisions = ActiveSupport::JSON.decode(open('http://data.cityofnewyork.us/resource/h9gi-nx95.json'))
 
# collisions.each do |collision|
#   Collision.create!(
#   	date: collision['date'],
#   	time: collision['time'],
#   	borough: collision['borough'],
#   	zipcode: collision['zip_code'], 
#   	lat: collision['latitude'],
#   	lon: collision['longitude'],
#   	street_name: collision['on_street_name'],
#   	cross_street: collision['cross_street_name'],
#   	off_street: collision['off_street_name'],
#   	persons_injured: collision['number_of_persons_injured'],
#   	persons_killed: collision['number_of_persons_killed'],
#   	pedestrians_injured: collision['number_of_pedestrians_injured'],
#   	pedestrians_killed: collision['number_of_pedestrians_killed'],
#   	cyclists_injured: collision['number_of_cyclist_injured'],
#   	cyclists_killed: collision['number_of_cyclist_killed'],
#   	motorists_injured: collision['number_of_motorist_injured'],
#   	motorists_killed: collision['number_of_motorist_killed'],
#   	contrib_vehicle_one: collision['contributing_factor_vehicle_1'],
#   	contrib_vehicle_two: collision['contributing_factor_vehicle_2'],
#   	contrib_vehicle_three: collision['contributing_factor_vehicle_3'],
#   	contrib_vehicle_four: collision['contributing_factor_vehicle_4'],
#   	contrib_vehicle_five: collision['contributing_factor_vehicle_5'],
#   	unique_key: collision['unique_key']
#   	)
# end
