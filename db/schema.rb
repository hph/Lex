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

ActiveRecord::Schema.define(version: 20140725192538) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "chapters", force: true do |t|
    t.integer "version_id", null: false
    t.string  "name",       null: false
    t.integer "ordinal",    null: false
  end

  create_table "laws", force: true do |t|
    t.integer  "version_id",   null: false
    t.integer  "chapter_id",   null: false
    t.string   "subchapter"
    t.text     "name",         null: false
    t.integer  "ordinal"
    t.datetime "date",         null: false
    t.text     "raw_html",     null: false
    t.string   "original_uri", null: false
  end

  create_table "versions", force: true do |t|
    t.string "name", null: false
  end

end
