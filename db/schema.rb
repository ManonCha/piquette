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

ActiveRecord::Schema.define(version: 2018_12_03_165020) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "bottle_grapes", force: :cascade do |t|
    t.bigint "grape_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["grape_id"], name: "index_bottle_grapes_on_grape_id"
  end

  create_table "bottles", force: :cascade do |t|
    t.string "title"
    t.bigint "region_id"
    t.bigint "country_id"
    t.bigint "bottle_grape_id"
    t.bigint "winery_id"
    t.bigint "color_id"
    t.integer "year"
    t.integer "best_before"
    t.integer "best_after"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["bottle_grape_id"], name: "index_bottles_on_bottle_grape_id"
    t.index ["color_id"], name: "index_bottles_on_color_id"
    t.index ["country_id"], name: "index_bottles_on_country_id"
    t.index ["region_id"], name: "index_bottles_on_region_id"
    t.index ["winery_id"], name: "index_bottles_on_winery_id"
  end

  create_table "colors", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "countries", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "grapes", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "meals", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "regions", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "reviews", force: :cascade do |t|
    t.bigint "bottle_id"
    t.integer "rating"
    t.text "comment"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["bottle_id"], name: "index_reviews_on_bottle_id"
    t.index ["user_id"], name: "index_reviews_on_user_id"
  end

  create_table "user_bottles", force: :cascade do |t|
    t.bigint "bottle_id"
    t.bigint "user_id"
    t.integer "quantity"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["bottle_id"], name: "index_user_bottles_on_bottle_id"
    t.index ["user_id"], name: "index_user_bottles_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "wine_pairings", force: :cascade do |t|
    t.bigint "bottle_id"
    t.bigint "meal_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["bottle_id"], name: "index_wine_pairings_on_bottle_id"
    t.index ["meal_id"], name: "index_wine_pairings_on_meal_id"
  end

  create_table "wineries", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "wishes", force: :cascade do |t|
    t.bigint "bottle_id"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["bottle_id"], name: "index_wishes_on_bottle_id"
    t.index ["user_id"], name: "index_wishes_on_user_id"
  end

  add_foreign_key "bottle_grapes", "grapes"
  add_foreign_key "bottles", "bottle_grapes"
  add_foreign_key "bottles", "colors"
  add_foreign_key "bottles", "countries"
  add_foreign_key "bottles", "regions"
  add_foreign_key "bottles", "wineries"
  add_foreign_key "reviews", "bottles"
  add_foreign_key "reviews", "users"
  add_foreign_key "user_bottles", "bottles"
  add_foreign_key "user_bottles", "users"
  add_foreign_key "wine_pairings", "bottles"
  add_foreign_key "wine_pairings", "meals"
  add_foreign_key "wishes", "bottles"
  add_foreign_key "wishes", "users"
end
