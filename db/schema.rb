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

ActiveRecord::Schema.define(version: 20150228175219) do

  create_table "accounts", force: true do |t|
    t.decimal  "balance",                precision: 10, scale: 2, null: false
    t.datetime "date_opened",                                     null: false
    t.integer  "customer_id",  limit: 8,                          null: false
    t.integer  "acct_type_id", limit: 1,                          null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "accounts", ["acct_type_id"], name: "fk_accounts_acct_types1_idx", using: :btree
  add_index "accounts", ["customer_id"], name: "fk_accounts_customers1_idx", using: :btree

  create_table "acct_transactions", force: true do |t|
    t.datetime "date",                                                     null: false
    t.text     "description",         limit: 255
    t.decimal  "amount",                          precision: 10, scale: 2, null: false
    t.integer  "account_id",          limit: 8,                            null: false
    t.integer  "transaction_type_id",                                      null: false
    t.decimal  "adjusted_bal",                    precision: 10, scale: 2, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "acct_transactions", ["account_id"], name: "fk_acct_transactions_accounts1_idx", using: :btree
  add_index "acct_transactions", ["date", "id"], name: "BY_DATE", using: :btree
  add_index "acct_transactions", ["transaction_type_id"], name: "fk_acct_transactions_transaction_types1_idx", using: :btree

  create_table "acct_types", force: true do |t|
    t.string  "name",          limit: 14
    t.decimal "interest_rate",            precision: 3, scale: 3, default: 0.0, null: false
  end

  create_table "addresses", primary_key: "customer_id", force: true do |t|
    t.string "address1",          limit: 60, null: false
    t.string "address2",          limit: 60
    t.string "zip_code_zip_code", limit: 5,  null: false
  end

  add_index "addresses", ["zip_code_zip_code"], name: "fk_addresses_zip_codes1_idx", using: :btree

  create_table "administrators", force: true do |t|
    t.string   "firstname",  limit: 40, null: false
    t.string   "lastname",   limit: 40, null: false
    t.uuid     "user_id",               null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "administrators", ["lastname", "firstname", "id"], name: "BY_LASTNAME", using: :btree
  add_index "administrators", ["user_id"], name: "fk_administrators_users_idx", using: :btree

  create_table "customers", force: true do |t|
    t.string   "phone1",     limit: 20
    t.string   "phone2",     limit: 20
    t.string   "title",      limit: 11
    t.string   "firstname",  limit: 40
    t.string   "lastname",   limit: 40
    t.uuid     "user_id",               null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "customers", ["lastname", "firstname"], name: "NAME_LAST_FIRST", using: :btree
  add_index "customers", ["user_id"], name: "fk_customers_users1_idx", using: :btree

  create_table "states", force: true do |t|
    t.string "name",         limit: 30, null: false
    t.string "abbreviation", limit: 5,  null: false
    t.string "assoc_press",  limit: 14, null: false
  end

  add_index "states", ["name", "id"], name: "BY_NAME", using: :btree

  create_table "transaction_types", force: true do |t|
    t.string "name", limit: 30
  end

  create_table "users", force: true do |t|
    t.string   "username",               limit: 30, default: "", null: false
    t.string   "password",               limit: 30, default: "", null: false
    t.string   "role",                   limit: 30
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "email",                             default: "", null: false
    t.string   "encrypted_password",                default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                     default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
  end

  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  add_index "users", ["username", "id"], name: "BY_USERNAME", using: :btree

  create_table "zip_codes", primary_key: "zip_code", force: true do |t|
    t.string "city",               limit: 45, null: false
    t.string "state_abbreviation", limit: 3,  null: false
  end

  add_index "zip_codes", ["state_abbreviation"], name: "fk_zip_codes_states1_idx", using: :btree

end
