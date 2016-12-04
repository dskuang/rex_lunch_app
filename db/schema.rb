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

ActiveRecord::Schema.define(version: 20161123234648) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"
  enable_extension "pg_trgm"

  create_table "emails", force: :cascade do |t|
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.integer  "restaurant_id"
    t.string   "send_to"
    t.datetime "sent_at"
    t.text     "subject"
    t.text     "message"
  end

  create_table "food_items", force: :cascade do |t|
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
    t.integer  "restaurant_id"
    t.string   "name"
    t.string   "photo_link"
    t.boolean  "side_dish",     default: false
    t.boolean  "vegetarian",    default: false
    t.boolean  "disabled",      default: false
  end

  create_table "orders", force: :cascade do |t|
    t.datetime "created_at",                               null: false
    t.datetime "updated_at",                               null: false
    t.integer  "restaurant_id"
    t.decimal  "purchased_amount", precision: 8, scale: 2
    t.datetime "serviced_at"
  end

  create_table "permissions", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "role_id"
    t.integer  "user_id"
  end

  create_table "restaurants", force: :cascade do |t|
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.string   "name"
    t.string   "url"
    t.string   "address_line_1"
    t.string   "address_line_2"
    t.string   "photo_link"
    t.string   "banner_link"
  end

  create_table "roles", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "name"
  end

  create_table "users", force: :cascade do |t|
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.string   "username"
    t.string   "password_digest", null: false
    t.string   "session_token",   null: false
    t.index ["username"], name: "index_users_on_username", unique: true, using: :btree
  end

end
