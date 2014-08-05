# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20140805010701) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "collisions", force: true do |t|
    t.string   "date"
    t.time     "time"
    t.string   "borough"
    t.integer  "zipcode"
    t.float    "lat"
    t.float    "lon"
    t.string   "location"
    t.string   "street_name"
    t.string   "cross_street"
    t.string   "off_street"
    t.integer  "persons_injured"
    t.integer  "persons_killed"
    t.integer  "pedestrians_injured"
    t.integer  "pedestrians_killed"
    t.integer  "cyclists_injured"
    t.integer  "cyclists_killed"
    t.integer  "motorists_injured"
    t.integer  "motorists_killed"
    t.string   "contrib_vehicle_one"
    t.string   "contrib_vehicle_two"
    t.string   "contrib_vehicle_three"
    t.string   "contrib_vehicle_four"
    t.string   "contrib_vehicle_five"
    t.integer  "unique_key"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "intersections", force: true do |t|
    t.string   "intersection"
    t.string   "borough"
    t.integer  "persons_injured"
    t.integer  "persons_killed"
    t.integer  "pedestrians_injured"
    t.integer  "pedestrians_killed"
    t.integer  "cyclists_injured"
    t.integer  "cyclists_killed"
    t.integer  "motorists_injured"
    t.integer  "motorists_killed"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.float    "lat"
    t.float    "lon"
    t.integer  "collisions"
  end

end
