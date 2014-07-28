class UpdateCollisionsDataTypes < ActiveRecord::Migration
  def change

  	change_column :collisions, :lat, 'double precision USING CAST(lat AS double precision)'
  	change_column :collisions, :lon, 'double precision USING CAST(lon AS double precision)'

  end
end
