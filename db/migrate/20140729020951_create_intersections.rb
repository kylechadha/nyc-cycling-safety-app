class CreateIntersections < ActiveRecord::Migration
  def change
    create_table :intersections do |t|
      t.string :intersection
      t.string :borough
      t.integer :persons_injured
      t.integer :persons_killed
      t.integer :pedestrians_injured
      t.integer :pedestrians_killed
      t.integer :cyclists_injured
      t.integer :cyclists_killed
      t.integer :motorists_injured
      t.integer :motorists_killed

      t.timestamps
    end
  end
end
