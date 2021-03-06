
# # To seed the FULL dataset
# # http://dev.socrata.com/consumers/getting-started.html (LOOK for: limit and offset)

Collision.delete_all

# # Will want to later set up this seed process a recurring weekly check -- and ideally write ONLY new rows
collisions = ActiveSupport::JSON.decode(open('http://data.cityofnewyork.us/resource/h9gi-nx95.json?$limit=10000'))
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
  
  # Maybe intersection + borough is a better key than location? Otherwise you have a ~15% of collisions unmapped because they don't have lat / lon info
  # The tradeof is the data might be inaccurate if you have multiple lat / lons mapped to one intersection --> only the first lat / lon is going to be included in the intersections db
  # # # Ah! New finding ... this doesn't work because then you get the on street name and off street name reversed, which makes it two separate intersections when it's not actually
  # Probably the best approach is to do it first by lat / lon, then by intersection if lat / lon is blank --> is there risk of overlap doing it this way?
  # location = "#{collision['on_street_name']}, #{collision['off_street_name']}, #{collision['borough']}"
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

  unless intersections[location]
    intersections[location] = {
      intersection_name: intersection_name,
      borough: collision['borough'],
      lat: collision['latitude'],
      lon: collision['longitude'],
      persons_injured: collision['number_of_persons_injured'].to_i,
      persons_killed: collision['number_of_persons_killed'].to_i,
      pedestrians_injured: collision['number_of_pedestrians_injured'].to_i,
      pedestrians_killed: collision['number_of_pedestrians_killed'].to_i,
      cyclists_injured: collision['number_of_cyclist_injured'].to_i,
      cyclists_killed: collision['number_of_cyclist_killed'].to_i,
      motorists_injured: collision['number_of_motorist_injured'].to_i,
      motorists_killed: collision['number_of_motorist_killed'].to_i,
      collisions: 1
    }
  else
    intersections[location][:collisions] += 1
    intersections[location][:persons_injured] += collision['number_of_persons_injured'].to_i
    intersections[location][:persons_killed] += collision['number_of_persons_killed'].to_i
    intersections[location][:pedestrians_injured] += collision['number_of_pedestrians_injured'].to_i
    intersections[location][:pedestrians_killed] += collision['number_of_pedestrians_killed'].to_i
    intersections[location][:cyclists_injured] += collision['number_of_cyclist_injured'].to_i
    intersections[location][:cyclists_killed] += collision['number_of_cyclist_killed'].to_i
    intersections[location][:motorists_injured] += collision['number_of_motorist_injured'].to_i
    intersections[location][:motorists_killed] += collision['number_of_motorist_killed'].to_i
  end

end

Intersection.delete_all
intersections.keys.each do |location|
  Intersection.create!(
    intersection: intersections[location][:intersection_name],
    borough: intersections[location][:borough],
    lat: intersections[location][:lat],
    lon: intersections[location][:lon],
    collisions: intersections[location][:collisions],
    persons_injured: intersections[location][:persons_injured],
    persons_killed: intersections[location][:persons_killed],
    pedestrians_injured: intersections[location][:pedestrians_injured],
    pedestrians_killed: intersections[location][:pedestrians_killed],
    cyclists_injured: intersections[location][:cyclists_injured],
    cyclists_killed: intersections[location][:cyclists_killed],
    motorists_injured: intersections[location][:motorists_injured],
    motorists_killed: intersections[location][:motorists_killed]
    # Maybe include list of unique IDs that populated the data for each intersection?
  )
end

# Could we then do all the averages / sums, and then do Intersection.update to cycle back through and add the new fields? (Danger Index, etc)


