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

ActiveRecord::Schema.define(version: 20150407161044) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "announcements", force: true do |t|
    t.string   "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "events", force: true do |t|
    t.string   "code"
    t.string   "description"
    t.datetime "startdate"
    t.datetime "enddate"
    t.string   "playerid"
    t.integer  "read"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "notifications", force: true do |t|
    t.integer  "notificationid"
    t.string   "code"
    t.string   "description"
    t.string   "notification"
    t.integer  "read"
    t.string   "playerid"
    t.integer  "bulb"
    t.datetime "startdate"
    t.datetime "enddate"
    t.datetime "drawingtime"
    t.integer  "num_of_entries"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "offers", force: true do |t|
    t.string   "code"
    t.string   "description"
    t.datetime "startdate"
    t.datetime "enddate"
    t.string   "playerid"
    t.integer  "read"
    t.integer  "total_bulbs"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "players", force: true do |t|
    t.string   "address"
    t.string   "clublevel"
    t.string   "contact"
    t.string   "encrypted_password"
    t.string   "encrypted_password_confirmation"
    t.string   "name"
    t.string   "playerid"
    t.string   "salt"
    t.integer  "ptsBal"
    t.integer  "ptsRed"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "promotions", force: true do |t|
    t.string   "code"
    t.string   "description"
    t.datetime "drawingtime"
    t.datetime "enddate"
    t.integer  "num_of_entries"
    t.string   "playerid"
    t.integer  "read"
    t.datetime "startdate"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
