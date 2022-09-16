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

ActiveRecord::Schema.define(version: 2022_09_16_183827) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "accounts", force: :cascade do |t|
    t.integer "UIN"
    t.text "FirstName"
    t.text "LastName"
    t.integer "PhoneNumber"
    t.text "Email"
    t.bigint "Status_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "status_id", null: false
    t.bigint "account_id", null: false
    t.index ["Status_id"], name: "index_accounts_on_Status_id"
    t.index ["account_id"], name: "index_accounts_on_account_id"
    t.index ["status_id"], name: "index_accounts_on_status_id"
  end

  create_table "authentications", force: :cascade do |t|
    t.text "password"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "events", force: :cascade do |t|
    t.text "Title"
    t.text "Description"
    t.date "Date"
    t.time "Time"
    t.text "Location"
    t.integer "Points"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "statuses", force: :cascade do |t|
    t.text "Value"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "accounts", "accounts"
  add_foreign_key "accounts", "statuses"
end
