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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20120917230336) do

  create_table "dices", :force => true do |t|
    t.integer  "value"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.integer  "round_id"
  end

  add_index "dices", ["round_id"], :name => "index_dices_on_round_id"

  create_table "games", :force => true do |t|
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "games_players", :id => false, :force => true do |t|
    t.integer "game_id"
    t.integer "player_id"
  end

  add_index "games_players", ["game_id", "player_id"], :name => "index_games_players_on_game_id_and_player_id"

  create_table "players", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "rounds", :force => true do |t|
    t.string   "name"
    t.integer  "points"
    t.integer  "iteration"
    t.boolean  "stay"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.integer  "turn_id"
    t.boolean  "complete"
  end

  add_index "rounds", ["turn_id"], :name => "index_rounds_on_turn_id"

  create_table "turns", :force => true do |t|
    t.integer  "total_points"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
    t.integer  "player_id"
    t.integer  "game_id"
  end

  add_index "turns", ["game_id"], :name => "index_turns_on_game_id"
  add_index "turns", ["player_id"], :name => "index_turns_on_player_id"

end
