class AddFieldstoIntersections < ActiveRecord::Migration
  def change

  	add_column :intersections, :lat, :float
  	add_column :intersections, :lon, :float
  	add_column :intersections, :collisions, :integer

  end
end
