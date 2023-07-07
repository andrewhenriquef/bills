# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 2023_07_07_020328) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "addresses", force: :cascade do |t|
    t.string "number", null: false
    t.string "zip_code", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id"
    t.index ["user_id"], name: "index_addresses_on_user_id"
  end

  create_table "companies", force: :cascade do |t|
    t.string "document", null: false
    t.string "name"
    t.string "email", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["document"], name: "index_companies_on_document", unique: true
    t.index ["email"], name: "index_companies_on_email", unique: true
  end

  create_table "payment_orders", force: :cascade do |t|
    t.decimal "value", precision: 10, scale: 2, null: false
    t.integer "kind"
    t.datetime "expires_at", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id"
    t.bigint "companies_id"
    t.bigint "address_id"
    t.bigint "payments_id"
    t.index ["address_id"], name: "index_payment_orders_on_address_id"
    t.index ["companies_id"], name: "index_payment_orders_on_companies_id"
    t.index ["payments_id"], name: "index_payment_orders_on_payments_id"
    t.index ["user_id"], name: "index_payment_orders_on_user_id"
  end

  create_table "payments", force: :cascade do |t|
    t.decimal "value"
    t.datetime "paid_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id"
    t.index ["user_id"], name: "index_payments_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "document", null: false
    t.string "name"
    t.string "email", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["document"], name: "index_users_on_document", unique: true
    t.index ["email"], name: "index_users_on_email", unique: true
  end

  add_foreign_key "addresses", "users"
  add_foreign_key "payment_orders", "addresses"
  add_foreign_key "payment_orders", "companies", column: "companies_id"
  add_foreign_key "payment_orders", "payments", column: "payments_id"
  add_foreign_key "payment_orders", "users"
  add_foreign_key "payments", "users"
end
