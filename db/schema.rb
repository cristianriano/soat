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

ActiveRecord::Schema.define(version: 20170518185752) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "coverages", force: :cascade do |t|
    t.float    "death"
    t.float    "medical"
    t.float    "inability"
    t.float    "transport"
    t.string   "currency"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "insurances", force: :cascade do |t|
    t.datetime "starts_at",  null: false
    t.datetime "ends_at",    null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "vehicle_id"
    t.integer  "rate_id"
    t.index ["rate_id"], name: "index_insurances_on_rate_id", using: :btree
    t.index ["vehicle_id"], name: "index_insurances_on_vehicle_id", using: :btree
  end

  create_table "rates", force: :cascade do |t|
    t.string   "code",                     null: false
    t.string   "category",                 null: false
    t.string   "subcategory",              null: false
    t.integer  "min_age",     default: 0,  null: false
    t.integer  "max_age",     default: 99, null: false
    t.float    "bonus",                    null: false
    t.float    "total",                    null: false
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "",    null: false
    t.string   "encrypted_password",     default: "",    null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
    t.string   "document",                               null: false
    t.string   "document_type",                          null: false
    t.string   "name",                                   null: false
    t.string   "lastname",                               null: false
    t.string   "phone"
    t.boolean  "admin",                  default: false
    t.index ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true, using: :btree
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  end

  create_table "vehicles", force: :cascade do |t|
    t.string   "license",     null: false
    t.string   "category",    null: false
    t.string   "subcategory", null: false
    t.integer  "age"
    t.string   "value_type"
    t.integer  "value"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "user_id"
    t.integer  "rate_id"
    t.index ["license"], name: "index_vehicles_on_license", unique: true, using: :btree
    t.index ["rate_id"], name: "index_vehicles_on_rate_id", using: :btree
    t.index ["user_id"], name: "index_vehicles_on_user_id", using: :btree
  end

  add_foreign_key "insurances", "rates"
  add_foreign_key "insurances", "vehicles"
  add_foreign_key "vehicles", "rates"
  add_foreign_key "vehicles", "users"
end
