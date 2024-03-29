# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.1].define(version: 2024_02_15_072147) do
  create_table "personels", force: :cascade do |t|
    t.string "name"
    t.string "surname"
    t.string "department"
    t.string "status"
    t.date "entry"
    t.date "due"
    t.date "birth"
    t.string "nation"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "img"
  end

  create_table "players", force: :cascade do |t|
    t.string "position"
    t.integer "height"
    t.string "foot"
    t.integer "market_value"
    t.integer "transfer_type"
    t.string "previous_club"
    t.integer "personel_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "kit_number"
    t.boolean "injured"
    t.index ["personel_id"], name: "index_players_on_personel_id"
  end

  add_foreign_key "players", "personels"
end
