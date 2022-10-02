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

ActiveRecord::Schema.define(version: 2022_09_22_034647) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "accounts", force: :cascade do |t|
    t.integer "UIN"
    t.text "FirstName"
    t.text "LastName"
    t.integer "PhoneNumber"
    t.text "Email"
    t.bigint "status_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["status_id"], name: "index_accounts_on_status_id"
  end

  create_table "event_types", force: :cascade do |t|
    t.text "Type"
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
    t.bigint "event_type_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["event_type_id"], name: "index_events_on_event_type_id"
  end

  create_table "points", force: :cascade do |t|
    t.bigint "account_id", null: false
    t.bigint "event_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["account_id"], name: "index_points_on_account_id"
    t.index ["event_id"], name: "index_points_on_event_id"
  end

  create_table "signups", force: :cascade do |t|
    t.bigint "event_id", null: false
    t.bigint "account_id", null: false
    t.boolean "Pickup"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["account_id"], name: "index_signups_on_account_id"
    t.index ["event_id"], name: "index_signups_on_event_id"
  end

  create_table "statuses", force: :cascade do |t|
    t.text "Value"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "accounts", "statuses"
  add_foreign_key "events", "event_types"
  add_foreign_key "points", "accounts"
  add_foreign_key "points", "events"
  add_foreign_key "signups", "accounts"
  add_foreign_key "signups", "events"
end
