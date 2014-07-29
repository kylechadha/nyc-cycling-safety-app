json.collisions do |json|
	json.array!(@collisions) do |collision|
		json.extract! collision, 
			:date,
			:time,
			:borough,
			:zipcode,
			:lat,
			:lon,
			:street_name,
			:cross_street,
			:off_street,
			:persons_injured,
			:persons_killed,
			:pedestrians_injured,
			:pedestrians_killed,
			:cyclists_injured,
			:cyclists_killed,
			:motorists_injured,
			:motorists_killed,
			:contrib_vehicle_one,
			:contrib_vehicle_two,
			:contrib_vehicle_three,
			:contrib_vehicle_four,
			:contrib_vehicle_five,
			:unique_key
	end
end