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

<<<<<<< HEAD
ActiveRecord::Schema.define(version: 20180405054939) do
=======
ActiveRecord::Schema.define(version: 20180405031145) do
>>>>>>> 0c22daa5ef0a6ed83e3280c4f910398488317f26

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "drivers", force: :cascade do |t|
    t.string "name"
    t.string "vin"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "car_make"
    t.text "car_model"
  end

  create_table "passengers", force: :cascade do |t|
    t.string "name"
    t.string "phone_num"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "trips", force: :cascade do |t|
    t.date "date"
    t.integer "rating"
    t.float "cost"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "passenger_id"
    t.bigint "driver_id"
    t.index ["driver_id"], name: "index_trips_on_driver_id"
    t.index ["passenger_id"], name: "index_trips_on_passenger_id"
  end

  add_foreign_key "trips", "drivers"
  add_foreign_key "trips", "passengers"
end
