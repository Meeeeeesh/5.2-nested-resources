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

ActiveRecord::Schema.define(version: 20150714210439) do

  create_table "albums", force: :cascade do |t|
    t.string   "title",      null: false
    t.integer  "artist_id",  null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "images"
    t.string   "video"
  end

  add_index "albums", ["artist_id"], name: "index_albums_on_artist_id"

  create_table "artist_albums", force: :cascade do |t|
    t.integer  "artist_id",  null: false
    t.integer  "album_id",   null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "artist_albums", ["artist_id", "album_id"], name: "index_artist_albums_on_artist_id_and_album_id", unique: true

  create_table "artists", force: :cascade do |t|
    t.string   "name",       null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "songs", force: :cascade do |t|
    t.string   "title",      null: false
    t.integer  "artist_id",  null: false
    t.integer  "album_id",   null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "songs", ["album_id"], name: "index_songs_on_album_id"
  add_index "songs", ["artist_id"], name: "index_songs_on_artist_id"

end
