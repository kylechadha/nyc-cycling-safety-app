
# # To seed the FULL dataset
# # http://dev.socrata.com/consumers/getting-started.html (LOOK for: limit and offset)

Collision.delete_all

# # Will want to later set up this seed process a recurring weekly check -- and ideally write ONLY new rows
collisions = ActiveSupport::JSON.decode(open('http://data.cityofnewyork.us/resource/h9gi-nx95.json'))
intersections = {}

collisions.each do |collision|
  Collision.create!(
    date: collision['date'],
    time: collision['time'],
    borough: collision['borough'],
    zipcode: collision['zip_code'], 
    lat: collision['latitude'],
    lon: collision['longitude'],
    street_name: collision['on_street_name'],
    cross_street: collision['off_street_name'],
    off_street: collision['cross_street_name'],
    persons_injured: collision['number_of_persons_injured'],
    persons_killed: collision['number_of_persons_killed'],
    pedestrians_injured: collision['number_of_pedestrians_injured'],
    pedestrians_killed: collision['number_of_pedestrians_killed'],
    cyclists_injured: collision['number_of_cyclist_injured'],
    cyclists_killed: collision['number_of_cyclist_killed'],
    motorists_injured: collision['number_of_motorist_injured'],
    motorists_killed: collision['number_of_motorist_killed'],
    contrib_vehicle_one: collision['contributing_factor_vehicle_1'],
    contrib_vehicle_two: collision['contributing_factor_vehicle_2'],
    contrib_vehicle_three: collision['contributing_factor_vehicle_3'],
    contrib_vehicle_four: collision['contributing_factor_vehicle_4'],
    contrib_vehicle_five: collision['contributing_factor_vehicle_5'],
    unique_key: collision['unique_key']
  )
  
  location = "(#{collision['latitude']}, #{collision['longitude']})" 
  if collision['on_street_name'] && collision['off_street_name']
    intersection_name = collision['on_street_name'] + ' and ' + collision['off_street_name']
  elsif collision['on_street_name']
    intersection_name = collision['on_street_name']
  elsif collision['off_street_name']
    intersection_name = collision['off_street_name']
  elsif collision['cross_street_name']
    intersection_name = collision['cross_street_name']
  else
    intersection_name = 'Unavailable'
  end

  # Ultimately will want to be able to handle cases where lat / lon is blank and try to map by intersection
  # Really you'd want this to be a key ... maybe intersection + borough is a better key than location
  unless intersections[location]
    intersections[location] = {intersection_name: intersection_name, borough: collision['borough'], lat: collision['latitude'], lon: collision['longitude'], collisions: 1}
  else
    intersections[location][:collisions] += 1
  end

  # intersectionArray.push({street_name: collision['on_street_name'], cross_street: collision['off_street_name'], borough: collision['borough']})
end

Intersection.delete_all
intersections.keys.each do |location|
  Intersection.create!(
    intersection: intersections[location][:intersection_name],
    borough: intersections[location][:borough],
    lat: intersections[location][:lat],
    lon: intersections[location][:lon],
    collisions: intersections[location][:collisions]
    # Maybe include list of unique IDs that populated the data for each intersection
  )
end


# intersectionSet = intersectionArray.to_set
# intersectionSet.each do |intersectionObj|
#   intersectionName = "#{intersectionObj[:street_name]} and #{intersectionObj[:cross_street]}"

#   Intersection.create!(
#     intersection: intersectionName,
#     borough: intersectionObj[:borough]
#   )
# end
