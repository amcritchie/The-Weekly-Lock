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

ActiveRecord::Schema.define(version: 20160904023225) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "games", force: true do |t|
    t.integer  "week_id"
    t.integer  "home_id"
    t.integer  "away_id"
    t.integer  "location"
    t.string   "slug"
    t.datetime "date"
  end

  create_table "performances", force: true do |t|
    t.integer "game_id"
    t.integer "team_id"
    t.string  "present_record"
    t.float   "spread"
    t.integer "odds"
    t.boolean "home"
    t.integer "q1"
    t.integer "q2"
    t.integer "q3"
    t.integer "q4"
    t.integer "ot"
    t.integer "total"
    t.string  "result"
  end

  create_table "picks", force: true do |t|
    t.integer "user_id"
    t.integer "performance_id"
    t.string  "slug"
    t.text    "notes"
    t.boolean "public_lock"
  end

  create_table "seasons", force: true do |t|
    t.integer "year"
    t.integer "sport_id"
  end

  create_table "sports", force: true do |t|
    t.string "name"
    t.string "slug"
  end

  create_table "teams", force: true do |t|
    t.string  "name"
    t.string  "location"
    t.string  "slug"
    t.string  "logo"
    t.string  "dark_color"
    t.string  "light_color"
    t.string  "sdql_id"
    t.integer "sport_id"
  end

  create_table "users", force: true do |t|
    t.string   "provider"
    t.string   "uid"
    t.string   "name"
    t.string   "oauth_token"
    t.datetime "oauth_expires_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "weeks", force: true do |t|
    t.integer "position"
    t.integer "season_id"
    t.boolean "matchup_built"
    t.boolean "results_built"
  end

end
