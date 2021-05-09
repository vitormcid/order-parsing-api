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

ActiveRecord::Schema.define(version: 2021_05_09_015724) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "billing_infos", force: :cascade do |t|
    t.string "doc_type"
    t.string "doc_number"
  end

  create_table "buyers", force: :cascade do |t|
    t.string "nickname"
    t.string "email"
    t.integer "phone_id"
    t.string "first_name"
    t.string "last_name"
    t.integer "billing_info_id"
  end

  create_table "cities", force: :cascade do |t|
    t.string "name"
  end

  create_table "countries", force: :cascade do |t|
    t.string "initials"
    t.string "name"
  end

  create_table "items", force: :cascade do |t|
    t.string "title"
  end

  create_table "neighborhoods", force: :cascade do |t|
    t.string "name"
  end

  create_table "order_items", force: :cascade do |t|
    t.integer "item_id"
    t.integer "quantity"
    t.float "unit_price"
    t.float "full_unit_price"
  end

  create_table "orders", force: :cascade do |t|
    t.integer "store_id"
    t.datetime "date_created"
    t.datetime "date_closed"
    t.datetime "last_updated"
    t.float "total_amount"
    t.integer "total_shipping"
    t.float "total_amount_with_shipping"
    t.float "paid_amount"
    t.datetime "expiration_date"
    t.integer "shipping_id"
    t.string "status"
    t.integer "buyer_id"
  end

  create_table "payments", force: :cascade do |t|
    t.integer "order_id"
    t.integer "payer_id"
    t.integer "installments"
    t.string "payment_type"
    t.string "paid"
    t.float "transaction_amount"
    t.integer "taxes_amount"
    t.float "shipping_cost"
    t.float "total_paid_amount"
    t.float "installment_amount"
    t.datetime "date_approved"
    t.datetime "date_created"
  end

  create_table "phones", force: :cascade do |t|
    t.integer "area_code"
    t.string "number"
  end

  create_table "receiver_addresses", force: :cascade do |t|
    t.string "address_line"
    t.string "street_name"
    t.string "street_number"
    t.string "comment"
    t.string "zip_code"
    t.integer "city_id"
    t.integer "state_id"
    t.integer "country_id"
    t.integer "neighborhood_id"
    t.integer "latitude"
    t.integer "longitude"
    t.string "receiver_phone"
  end

  create_table "shippings", force: :cascade do |t|
    t.string "shipment_type"
    t.datetime "date_created"
    t.integer "receiver_address_id"
  end

  create_table "states", force: :cascade do |t|
    t.string "name"
  end

end
