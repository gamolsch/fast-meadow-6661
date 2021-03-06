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

ActiveRecord::Schema.define(version: 20140526143336) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "categories", force: true do |t|
    t.integer  "storage_id"
    t.string   "color"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "items", force: true do |t|
    t.string   "manufacturer"
    t.string   "name"
    t.string   "lot_number"
    t.date     "manufactured_on"
    t.date     "expired_on"
    t.string   "unit_of_measure"
    t.string   "color"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "category_id"
    t.string   "code"
  end

  create_table "storages", force: true do |t|
    t.string   "name"
    t.boolean  "hazardous"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "transactions", force: true do |t|
    t.integer  "user_id"
    t.integer  "item_id"
    t.string   "action"
    t.integer  "ammount_changed"
    t.integer  "storage_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "password"
  end

end
