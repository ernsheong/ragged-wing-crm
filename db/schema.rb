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

ActiveRecord::Schema.define(:version => 20120405044410) do

  create_table "addresses", :force => true do |t|
    t.string   "street"
    t.string   "city"
    t.string   "state"
    t.string   "zip"
    t.string   "country"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "donations", :force => true do |t|
    t.integer  "person_id"
    t.integer  "organization_id"
    t.float    "amount"
    t.date     "date"
    t.string   "payment_method"
    t.string   "campaign"
    t.string   "solicitation_method"
    t.integer  "perk_id"
    t.integer  "point_of_contact_id"
    t.datetime "created_at",          :null => false
    t.datetime "updated_at",          :null => false
  end

  create_table "members", :force => true do |t|
    t.integer  "person_id"
    t.integer  "organization_id"
    t.string   "role"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
  end

  create_table "organizations", :force => true do |t|
    t.string   "name"
    t.integer  "person_id"
    t.integer  "address_id"
    t.string   "website"
    t.string   "type"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "people", :force => true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "title"
    t.string   "phone_cell"
    t.string   "phone_home"
    t.string   "phone_office"
    t.string   "email1"
    t.string   "email2"
    t.integer  "address_id_1"
    t.integer  "address_id_2"
    t.string   "website1"
    t.string   "website2"
    t.string   "other"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  create_table "relationships", :force => true do |t|
    t.integer  "person_id"
    t.string   "type"
    t.boolean  "internal"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "email"
    t.string   "identifier_url"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
  end

end
