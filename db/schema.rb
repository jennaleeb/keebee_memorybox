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

ActiveRecord::Schema.define(version: 20160713203051) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "advanced_patient_searches", force: :cascade do |t|
    t.string   "keywords"
    t.integer  "search_category_id"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
  end

  create_table "interest_categories", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "interests", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "category_id"
  end

  add_index "interests", ["category_id"], name: "index_interests_on_category_id", using: :btree

  create_table "patient_interests", force: :cascade do |t|
    t.integer  "patient_id"
    t.integer  "interest_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "patient_interests", ["interest_id"], name: "index_patient_interests_on_interest_id", using: :btree
  add_index "patient_interests", ["patient_id"], name: "index_patient_interests_on_patient_id", using: :btree

  create_table "patient_search_categories", force: :cascade do |t|
    t.string   "keyword"
    t.integer  "advanced_patient_search_id"
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.integer  "search_category_id"
  end

  add_index "patient_search_categories", ["advanced_patient_search_id"], name: "index_patient_search_categories_on_advanced_patient_search_id", using: :btree

  create_table "patients", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.string   "nickname"
    t.string   "language"
    t.string   "birthplace"
    t.string   "home_base"
    t.string   "spouse_name"
    t.string   "children"
    t.string   "grandchildren"
    t.string   "occupation"
    t.string   "pets"
    t.text     "additional_info"
    t.integer  "user_id"
    t.string   "rfid_number"
    t.string   "residence"
  end

  add_index "patients", ["user_id"], name: "index_patients_on_user_id", using: :btree

  create_table "photos", force: :cascade do |t|
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.integer  "patient_id"
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
  end

  create_table "songs", force: :cascade do |t|
    t.string   "title"
    t.string   "artist"
    t.string   "url"
    t.integer  "patient_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "songs", ["patient_id"], name: "index_songs_on_patient_id", using: :btree

  create_table "tags", force: :cascade do |t|
    t.string   "name"
    t.integer  "photo_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "tags", ["photo_id"], name: "index_tags_on_photo_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: ""
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "user_category"
  end

  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  create_table "videos", force: :cascade do |t|
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
    t.string   "clip_file_name"
    t.string   "clip_content_type"
    t.integer  "clip_file_size"
    t.datetime "clip_updated_at"
    t.integer  "patient_id"
  end

  add_index "videos", ["patient_id"], name: "index_videos_on_patient_id", using: :btree

  add_foreign_key "interests", "interest_categories", column: "category_id"
  add_foreign_key "patient_interests", "interests"
  add_foreign_key "patient_interests", "patients"
  add_foreign_key "patient_search_categories", "advanced_patient_searches"
  add_foreign_key "patients", "users"
  add_foreign_key "songs", "patients"
  add_foreign_key "tags", "photos"
  add_foreign_key "videos", "patients"
end
