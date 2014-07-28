class CreateCollisions < ActiveRecord::Migration
  def change
    create_table :collisions do |t|
      t.string :date
      t.time :time
      t.string :borough
      t.integer :zipcode
      t.integer :lat
      t.integer :lon
      t.string :location
      t.string :street_name
      t.string :cross_street
      t.string :off_street
      t.integer :persons_injured
      t.integer :persons_killed
      t.integer :pedestrians_injured
      t.integer :pedestrians_killed
      t.integer :cyclists_injured
      t.integer :cyclists_killed
      t.integer :motorists_injured
      t.integer :motorists_killed
      t.string :contrib_vehicle_one
      t.string :contrib_vehicle_two
      t.string :contrib_vehicle_three
      t.string :contrib_vehicle_four
      t.string :contrib_vehicle_five
      t.integer :unique_key

      t.timestamps
    end
  end
end
