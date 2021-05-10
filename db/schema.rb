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

ActiveRecord::Schema.define(version: 2021_05_10_163108) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "addresses", force: :cascade do |t|
    t.string "country"
    t.string "state"
    t.string "city"
    t.string "district"
    t.string "street"
    t.string "complement"
    t.float "latitude"
    t.float "longitude"
    t.string "postalCode"
    t.string "number"
  end

  create_table "customers", force: :cascade do |t|
    t.string "externalCode"
    t.string "name"
    t.string "email"
    t.string "contact"
  end

  create_table "items", force: :cascade do |t|
    t.string "externalCode"
    t.string "name"
    t.float "price"
  end

  create_table "order_items", force: :cascade do |t|
    t.integer "order_id"
    t.integer "item_id"
    t.integer "quantity"
    t.float "total"
  end

  create_table "orders", force: :cascade do |t|
    t.integer "address_id"
    t.integer "customer_id"
    t.string "externalCode"
    t.integer "storeId"
    t.string "subTotal"
    t.string "deliveryFee"
    t.float "total_shipping"
    t.string "total"
    t.string "dtOrderCreate"
  end

  create_table "payments", force: :cascade do |t|
    t.integer "order_id"
    t.string "kind"
    t.float "value"
  end

end
