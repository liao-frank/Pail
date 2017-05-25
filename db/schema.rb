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

ActiveRecord::Schema.define(version: 20170525212709) do

  create_table "fundraisers", force: :cascade do |t|
    t.integer  "owner_id"
    t.string   "name"
    t.string   "category"
    t.float    "goal"
    t.float    "raised"
    t.date     "start_date"
    t.date     "end_date"
    t.string   "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "organization_users", force: :cascade do |t|
    t.integer  "org_id"
    t.integer  "user_id"
    t.string   "role"
    t.string   "title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "organizations", force: :cascade do |t|
    t.string   "name"
    t.string   "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "paybacks", force: :cascade do |t|
    t.integer  "payment_id"
    t.date     "date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "payments", force: :cascade do |t|
    t.integer  "payee_id"
    t.integer  "payer_id"
    t.integer  "fundraiser_id"
    t.float    "amount"
    t.string   "message"
    t.string   "payment_receipt"
    t.date     "date"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email"
    t.string   "nickname"
    t.string   "password_digest"
    t.float    "funds"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

end
