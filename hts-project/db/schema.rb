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

ActiveRecord::Schema.define(version: 20141219115304) do

  create_table "admins", force: true do |t|
    t.string   "email",                  default: "", null: false
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
  end

  add_index "admins", ["email"], name: "index_admins_on_email", unique: true
  add_index "admins", ["reset_password_token"], name: "index_admins_on_reset_password_token", unique: true

  create_table "groupphotos", force: true do |t|
    t.string   "file_name"
    t.integer  "person_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "news", force: true do |t|
    t.string   "title"
    t.text     "content"
    t.string   "image"
    t.boolean  "before"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "twitter"
    t.string   "facebook"
    t.string   "linkedin"
  end

  create_table "people", force: true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.integer  "graduation_year"
    t.string   "major"
    t.string   "address"
    t.string   "postcode"
    t.string   "city"
    t.string   "email"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "unique_code"
  end

  create_table "photoalbums", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "photos", force: true do |t|
    t.string   "file_name"
    t.integer  "photoalbum_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "processed_images", force: true do |t|
    t.string   "file_name"
    t.integer  "person_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "file_name_processing", default: false, null: false
    t.string   "file_name_tmp"
  end

  create_table "schedules", force: true do |t|
    t.datetime "start_time"
    t.datetime "end_time"
    t.text     "content"
    t.string   "icon"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "title"
    t.string   "speaker"
    t.string   "location"
  end

  create_table "users", force: true do |t|
    t.string   "email",                  default: "", null: false
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
    t.integer  "person_id"
    t.string   "unique_code"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

end
