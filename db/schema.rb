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

ActiveRecord::Schema.define(version: 20160710230545) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "blocks", force: :cascade do |t|
    t.integer  "order_id"
    t.string   "name"
    t.text     "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "blocks", ["order_id"], name: "index_blocks_on_order_id", using: :btree

  create_table "components", force: :cascade do |t|
    t.integer  "block_id"
    t.string   "title"
    t.string   "head"
    t.text     "description"
    t.text     "footer"
    t.decimal  "price",       precision: 8, scale: 2
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
  end

  add_index "components", ["block_id"], name: "index_components_on_block_id", using: :btree

  create_table "items", force: :cascade do |t|
    t.integer  "component_id"
    t.string   "title"
    t.string   "subtitle"
    t.text     "description"
    t.decimal  "price",        precision: 8, scale: 2
    t.datetime "created_at",                           null: false
    t.datetime "updated_at",                           null: false
  end

  add_index "items", ["component_id"], name: "index_items_on_component_id", using: :btree

  create_table "messages", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "component_id"
    t.text     "body"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  add_index "messages", ["component_id"], name: "index_messages_on_component_id", using: :btree
  add_index "messages", ["user_id"], name: "index_messages_on_user_id", using: :btree

  create_table "order_images", force: :cascade do |t|
    t.integer  "order_id"
    t.string   "mockup"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "order_images", ["order_id"], name: "index_order_images_on_order_id", using: :btree

  create_table "orders", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "code"
    t.boolean  "enable"
    t.date     "starting_at"
    t.date     "ending_at"
    t.integer  "order_type"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.boolean  "approved"
  end

  add_index "orders", ["user_id"], name: "index_orders_on_user_id", using: :btree

  create_table "users", force: :cascade do |t|
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
    t.string   "name"
    t.integer  "role"
    t.string   "company"
    t.string   "username"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  add_foreign_key "blocks", "orders"
  add_foreign_key "components", "blocks"
  add_foreign_key "items", "components"
  add_foreign_key "messages", "components"
  add_foreign_key "messages", "users"
  add_foreign_key "order_images", "orders"
  add_foreign_key "orders", "users"
end
