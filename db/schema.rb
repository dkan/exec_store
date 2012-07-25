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

ActiveRecord::Schema.define(:version => 20120703025836) do

  create_table "hoodies", :force => true do |t|
    t.string   "color1"
    t.string   "color2"
    t.string   "size"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "orders", :force => true do |t|
    t.string   "hoodie"
    t.string   "billing_name"
    t.string   "email"
    t.string   "stripe_token"
    t.string   "billing_address1"
    t.string   "billing_address2"
    t.string   "billing_state"
    t.string   "billing_zip"
    t.string   "billing_city"
    t.string   "shipping_name"
    t.string   "shipping_address1"
    t.string   "shipping_address2"
    t.string   "shipping_state"
    t.string   "shipping_zip"
    t.string   "shipping_city"
    t.datetime "created_at",        :null => false
    t.datetime "updated_at",        :null => false
  end

end
