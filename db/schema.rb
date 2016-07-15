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

ActiveRecord::Schema.define(version: 20160714070841) do

  create_table "chapters", force: true do |t|
    t.integer  "serial_id"
    t.integer  "season"
    t.integer  "chapter"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "chapters", ["serial_id"], name: "index_chapters_on_serial_id", using: :btree

  create_table "products", force: true do |t|
    t.string   "type"
    t.string   "title"
    t.string   "plot"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "purchase_options", force: true do |t|
    t.integer  "product_id"
    t.float    "price"
    t.string   "video_quality"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "purchase_options", ["product_id"], name: "index_purchase_options_on_product_id", using: :btree

  create_table "tickets", force: true do |t|
    t.integer  "user_id"
    t.integer  "purchase_option_id"
    t.integer  "product_id"
    t.datetime "purchase_date"
    t.datetime "expiration_date"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "tickets", ["product_id"], name: "index_tickets_on_product_id", using: :btree
  add_index "tickets", ["purchase_option_id"], name: "index_tickets_on_purchase_option_id", using: :btree
  add_index "tickets", ["user_id"], name: "index_tickets_on_user_id", using: :btree

  create_table "users", force: true do |t|
    t.string   "email"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
