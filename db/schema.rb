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

ActiveRecord::Schema.define(version: 20150102221639) do

  create_table "appointments", force: true do |t|
    t.integer  "user_id"
    t.integer  "hairdresser_id"
    t.text     "message"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "confirmed_at"
    t.datetime "appointment_at"
  end

  create_table "categories", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "categories_pictures", id: false, force: true do |t|
    t.integer "picture_id"
    t.integer "category_id"
  end

  create_table "hairdressers", force: true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.text     "career"
    t.string   "salon_address"
    t.string   "salon_url"
    t.text     "personal_message"
    t.integer  "picture_id"
    t.integer  "category_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "email"
    t.string   "password_digest"
    t.string   "encrypted_password",                             default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                                  default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "picture"
    t.text     "status"
    t.boolean  "available"
    t.decimal  "latitude",               precision: 9, scale: 6
    t.decimal  "longitude",              precision: 9, scale: 6
    t.string   "member_ID"
    t.boolean  "verified"
  end

  add_index "hairdressers", ["email"], name: "index_hairdressers_on_email", unique: true
  add_index "hairdressers", ["reset_password_token"], name: "index_hairdressers_on_reset_password_token", unique: true

  create_table "pictures", force: true do |t|
    t.integer  "hairdresser_id"
    t.string   "source"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "imageable_id"
    t.string   "imageable_type"
    t.string   "picture"
  end

  create_table "reviews", force: true do |t|
    t.text     "comment"
    t.integer  "hairdresser_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
  end

  create_table "searches", force: true do |t|
    t.string   "keywords"
    t.integer  "category_id"
    t.integer  "minimum_price"
    t.integer  "maximum_price"
    t.string   "area"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "services", force: true do |t|
    t.string   "name"
    t.integer  "price_in_cents"
    t.integer  "hairdresser_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "first_name",                          null: false
    t.string   "last_name",                           null: false
    t.string   "email",                               null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "reset_password_token"
    t.string   "picture"
    t.string   "encrypted_password",     default: "", null: false
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token"

end
