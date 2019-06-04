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

ActiveRecord::Schema.define(version: 2019_06_03_184245) do

  create_table "cars", force: :cascade do |t|
    t.integer "year"
    t.string "make"
    t.string "model"
    t.integer "coolness_value"
    t.integer "horsepower"
    t.integer "torque"
    t.integer "weight"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "garage_id"
    t.string "photo_url"
    t.index ["garage_id"], name: "index_cars_on_garage_id"
  end

  create_table "garages", force: :cascade do |t|
    t.integer "user_id"
    t.integer "capacity"
    t.integer "car_count"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_garages_on_user_id"
  end

  create_table "ownedcars", force: :cascade do |t|
    t.integer "year"
    t.string "make"
    t.string "model"
    t.integer "coolness_value"
    t.integer "horsepower"
    t.integer "torque"
    t.integer "weight"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_ownedcars_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "username"
    t.string "password"
    t.string "email"
    t.integer "garage_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["garage_id"], name: "index_users_on_garage_id"
  end

end
