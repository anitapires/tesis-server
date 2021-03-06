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

ActiveRecord::Schema.define(version: 4) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "drawings", force: :cascade do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "points", force: :cascade do |t|
    t.integer "section_id"
    t.decimal "latitude",   precision: 11, scale: 8
    t.decimal "longitude",  precision: 11, scale: 8
  end

  add_index "points", ["section_id"], name: "index_points_on_section_id", using: :btree

  create_table "sections", force: :cascade do |t|
    t.integer "drawing_id"
  end

  add_index "sections", ["drawing_id"], name: "index_sections_on_drawing_id", using: :btree

  create_table "strokes", force: :cascade do |t|
    t.integer "section_id"
    t.string  "color"
  end

  add_index "strokes", ["section_id"], name: "index_strokes_on_section_id", using: :btree

  add_foreign_key "points", "sections"
  add_foreign_key "sections", "drawings"
  add_foreign_key "strokes", "sections"
end
