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

ActiveRecord::Schema.define(version: 20160912191547) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "books", force: true do |t|
    t.string   "szerzo"
    t.string   "cim",          limit: 500
    t.string   "jelzet"
    t.string   "kiado"
    t.string   "ev"
    t.string   "kulso_leiras"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "allapot"
    t.string   "lender"
    t.date     "deadline"
    t.string   "raktar"
    t.string   "targyszavak",  limit: 1024
    t.string   "megjegyzesek"
  end

  create_table "lendings", force: true do |t|
    t.text     "lender"
    t.integer  "book_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.date     "deadline"
  end

  add_index "lendings", ["book_id"], name: "index_lendings_on_book_id", using: :btree

end
