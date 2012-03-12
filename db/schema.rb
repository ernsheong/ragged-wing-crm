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

ActiveRecord::Schema.define(:version => 20120312052334) do

  create_table "contacts", :force => true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "title"
    t.string   "role"
    t.string   "phone_1"
    t.string   "phone_2"
    t.string   "phone_3"
    t.string   "email_1"
    t.string   "email_2"
    t.string   "street_1"
    t.string   "city_1"
    t.string   "state_1"
    t.string   "zip_1"
    t.string   "country_1"
    t.string   "street_2"
    t.string   "city_2"
    t.string   "state_2"
    t.string   "zip_2"
    t.string   "country_2"
    t.string   "website_1"
    t.string   "website_2"
    t.string   "other"
    t.boolean  "internal"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

end
