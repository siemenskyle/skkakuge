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

ActiveRecord::Schema.define(version: 20160205133650) do

  create_table "games", force: true do |t|
    t.string   "name"
    t.string   "longname"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "logins", force: true do |t|
    t.string   "pw"
    t.string   "adminkey"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "playerranks", force: true do |t|
    t.integer  "scaledpoints"
    t.integer  "totalpoints"
    t.integer  "game_id"
    t.integer  "player_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "playerranks", ["game_id"], name: "index_playerranks_on_game_id"
  add_index "playerranks", ["player_id"], name: "index_playerranks_on_player_id"

  create_table "players", force: true do |t|
    t.string   "name"
    t.string   "aliases"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "tournaments", force: true do |t|
    t.string   "name"
    t.date     "date"
    t.integer  "game_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "tournaments", ["game_id"], name: "index_tournaments_on_game_id"

  create_table "tourneyresults", force: true do |t|
    t.integer  "placing"
    t.integer  "points"
    t.integer  "tournament_id"
    t.integer  "playerrank_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "tourneyresults", ["playerrank_id"], name: "index_tourneyresults_on_playerrank_id"
  add_index "tourneyresults", ["tournament_id"], name: "index_tourneyresults_on_tournament_id"

end
