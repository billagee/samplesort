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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20130922080305) do

  create_table "artists", :force => true do |t|
    t.string   "name"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
    t.string   "aliases"
    t.string   "display_name"
  end

  create_table "recordings", :force => true do |t|
    t.string   "name"
    t.integer  "artist_id"
    t.integer  "release_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "recordings", ["artist_id"], :name => "index_recordings_on_artist_id"
  add_index "recordings", ["release_id"], :name => "index_recordings_on_release_id"

  create_table "releases", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "sample_sources", :force => true do |t|
    t.string   "title"
    t.text     "description"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "samples", :force => true do |t|
    t.text     "transcript"
    t.integer  "sample_source_id"
    t.integer  "recording_id"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
  end

  add_index "samples", ["recording_id"], :name => "index_samples_on_recording_id"
  add_index "samples", ["sample_source_id"], :name => "index_samples_on_sample_source_id"

end
