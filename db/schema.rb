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

ActiveRecord::Schema.define(version: 20150820124612) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "conventions", force: :cascade do |t|
    t.string  "title"
    t.string  "convention_email"
    t.integer "timeslot_duration"
  end

  create_table "days", force: :cascade do |t|
    t.date    "date"
    t.string  "name"
    t.boolean "public",        default: false
    t.integer "convention_id"
  end

  add_index "days", ["convention_id"], name: "index_days_on_convention_id", using: :btree

  create_table "events", force: :cascade do |t|
    t.string  "timetable_name"
    t.string  "conbook_name"
    t.string  "conbook_description"
    t.time    "start_time",           default: '2000-01-01 00:00:00'
    t.integer "setup_duration",       default: 15
    t.integer "seating_duration",     default: 0
    t.integer "event_duration",       default: 30
    t.integer "teardown_duration",    default: 15
    t.boolean "public",               default: false
    t.string  "room_layout"
    t.string  "convention_equipment"
    t.string  "hotel_equipment"
    t.string  "event_runners"
    t.string  "notes"
    t.integer "convention_id"
    t.integer "day_id"
    t.integer "room_id"
    t.integer "track_id"
  end

  add_index "events", ["convention_id"], name: "index_events_on_convention_id", using: :btree
  add_index "events", ["day_id"], name: "index_events_on_day_id", using: :btree
  add_index "events", ["room_id"], name: "index_events_on_room_id", using: :btree
  add_index "events", ["track_id"], name: "index_events_on_track_id", using: :btree

  create_table "rooms", force: :cascade do |t|
    t.string  "name"
    t.string  "public_name"
    t.integer "convention_id"
  end

  add_index "rooms", ["convention_id"], name: "index_rooms_on_convention_id", using: :btree

  create_table "tracks", force: :cascade do |t|
    t.string  "name"
    t.integer "rank"
    t.integer "convention_id"
  end

  add_index "tracks", ["convention_id"], name: "index_tracks_on_convention_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "name",                         null: false
    t.string   "email",                        null: false
    t.string   "crypted_password"
    t.string   "salt"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "remember_me_token"
    t.datetime "remember_me_token_expires_at"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["remember_me_token"], name: "index_users_on_remember_me_token", using: :btree

end
