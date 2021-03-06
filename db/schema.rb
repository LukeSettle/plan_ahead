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

ActiveRecord::Schema.define(version: 20180815162048) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "lodging_events", force: :cascade do |t|
    t.string "address"
    t.string "title"
    t.float "price"
    t.string "price_type"
    t.string "link"
    t.string "confirmation_number"
    t.string "currency"
    t.string "starts_at"
    t.string "ends_at"
    t.bigint "plan_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["plan_id"], name: "index_lodging_events_on_plan_id"
  end

  create_table "parent_events", force: :cascade do |t|
    t.string "title"
    t.bigint "plan_id"
    t.datetime "starts_at"
    t.datetime "ends_at"
    t.string "kind"
    t.float "price"
    t.string "currency"
    t.string "link"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["plan_id"], name: "index_parent_events_on_plan_id"
  end

  create_table "plans", force: :cascade do |t|
    t.string "title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "travel_events", force: :cascade do |t|
    t.bigint "plan_id"
    t.string "origin"
    t.string "destination"
    t.datetime "departure_time"
    t.datetime "arrival_time"
    t.string "mode_of_transportation"
    t.jsonb "data"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["plan_id"], name: "index_travel_events_on_plan_id"
  end

end
