json.intersections do |json|
  json.array!(@intersections) do |intersection|
    json.extract! intersection, 
      :intersection,
      :borough,
      :persons_injured,
      :persons_killed,
      :pedestrians_injured,
      :pedestrians_killed,
      :cyclists_injured,
      :cyclists_killed,
      :motorists_injured,
      :motorists_killed,
      :created_at,
      :updated_at,
      :lat,
      :lon,
      :collisions
  end
end