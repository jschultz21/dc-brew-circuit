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

ActiveRecord::Schema.define(version: 20160709020339) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "adds", force: :cascade do |t|
    t.integer  "brewery_id"
    t.integer  "user_id"
    t.integer  "added_id"
    t.string   "added_type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "adds", ["added_type", "added_id"], name: "index_adds_on_added_type_and_added_id", using: :btree
  add_index "adds", ["user_id"], name: "index_adds_on_user_id", using: :btree

  create_table "beers", force: :cascade do |t|
    t.string   "name",       null: false
    t.string   "style",      null: false
    t.string   "photo_url"
    t.string   "abv"
    t.integer  "brewery_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "user_id"
  end

  create_table "breweries", force: :cascade do |t|
    t.string   "name"
    t.string   "photo_url"
    t.string   "address"
    t.string   "logo_img"
    t.string   "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "favorites", force: :cascade do |t|
    t.integer  "beer_id"
    t.integer  "user_id"
    t.integer  "favorited_id"
    t.string   "favorited_type"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  add_index "favorites", ["favorited_type", "favorited_id"], name: "index_favorites_on_favorited_type_and_favorited_id", using: :btree
  add_index "favorites", ["user_id"], name: "index_favorites_on_user_id", using: :btree

  create_table "quotes", force: :cascade do |t|
    t.string   "text"
    t.string   "author"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "reviews", force: :cascade do |t|
    t.string   "body",       null: false
    t.integer  "beer_id"
    t.integer  "brewery_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
