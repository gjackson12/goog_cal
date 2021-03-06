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

ActiveRecord::Schema.define(version: 20131019213600) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "reservations", force: true do |t|
    t.string   "summary",         null: false
    t.string   "description",     null: false
    t.datetime "start_at",        null: false
    t.datetime "end_at",          null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "room_id"
    t.string   "google_event_id"
    t.integer  "user_id"
  end

  create_table "rooms", force: true do |t|
    t.string   "name"
    t.string   "location"
    t.string   "room_number"
    t.string   "google_calendar_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
  end

  create_table "users", force: true do |t|
    t.string "uid"
    t.string "email"
  end

end
