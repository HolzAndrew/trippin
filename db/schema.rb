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

ActiveRecord::Schema.define(version: 20160211000250) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "comments", force: :cascade do |t|
    t.string   "comment"
    t.integer  "user_id"
    t.integer  "trip_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "comments", ["trip_id"], name: "index_comments_on_trip_id", using: :btree
  add_index "comments", ["user_id"], name: "index_comments_on_user_id", using: :btree

  create_table "invitations", force: :cascade do |t|
    t.string   "email"
    t.boolean  "accept"
    t.integer  "trip_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "invitations", ["trip_id"], name: "index_invitations_on_trip_id", using: :btree

  create_table "locations", force: :cascade do |t|
    t.string   "loc_long"
    t.string   "loc_lat"
    t.string   "address"
    t.string   "venue"
    t.integer  "trip_id"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "locations", ["trip_id"], name: "index_locations_on_trip_id", using: :btree
  add_index "locations", ["user_id"], name: "index_locations_on_user_id", using: :btree

  create_table "trip_user_lists", force: :cascade do |t|
    t.integer  "trip_id"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "trip_user_lists", ["trip_id"], name: "index_trip_user_lists_on_trip_id", using: :btree
  add_index "trip_user_lists", ["user_id"], name: "index_trip_user_lists_on_user_id", using: :btree

  create_table "trips", force: :cascade do |t|
    t.string   "name"
    t.string   "lat"
    t.string   "lng"
    t.string   "trip_date"
    t.string   "description"
    t.integer  "user_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "trips", ["user_id"], name: "index_trips_on_user_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.string   "password_digest"
    t.string   "image_url"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.integer  "trip_id"
  end

  add_index "users", ["trip_id"], name: "index_users_on_trip_id", using: :btree

  add_foreign_key "comments", "trips"
  add_foreign_key "comments", "users"
  add_foreign_key "invitations", "trips"
  add_foreign_key "locations", "trips"
  add_foreign_key "locations", "users"
  add_foreign_key "trip_user_lists", "trips"
  add_foreign_key "trip_user_lists", "users"
  add_foreign_key "trips", "users"
  add_foreign_key "users", "trips"
end
