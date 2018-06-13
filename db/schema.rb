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

ActiveRecord::Schema.define(version: 20180613174522) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "convoy_plans", force: :cascade do |t|
    t.string   "title"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "convoy_plans", ["user_id"], name: "index_convoy_plans_on_user_id", using: :btree

  create_table "permissions", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "invited_user"
    t.string   "permission_plan"
    t.string   "permission_vehicle"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
  end

  add_index "permissions", ["user_id"], name: "index_permissions_on_user_id", using: :btree

  create_table "plans", force: :cascade do |t|
    t.text     "situation"
    t.text     "mission"
    t.text     "execution"
    t.text     "service_support"
    t.text     "command_signal"
    t.integer  "convoy_plan_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  add_index "plans", ["convoy_plan_id"], name: "index_plans_on_convoy_plan_id", using: :btree

  create_table "soldiers", force: :cascade do |t|
    t.string   "name"
    t.string   "rank"
    t.string   "position"
    t.integer  "vehicle_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "soldiers", ["vehicle_id"], name: "index_soldiers_on_vehicle_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "user_name"
    t.string   "email"
    t.string   "password_digest"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  create_table "vehicles", force: :cascade do |t|
    t.string   "type"
    t.string   "call_sign"
    t.integer  "serial_number"
    t.integer  "order_of_movement"
    t.string   "bumper_number"
    t.integer  "convoy_plan_id"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
  end

  add_index "vehicles", ["convoy_plan_id"], name: "index_vehicles_on_convoy_plan_id", using: :btree

  add_foreign_key "convoy_plans", "users"
  add_foreign_key "permissions", "users"
  add_foreign_key "plans", "convoy_plans"
  add_foreign_key "soldiers", "vehicles"
  add_foreign_key "vehicles", "convoy_plans"
end
