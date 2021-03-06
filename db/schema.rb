# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2019_10_24_181901) do

  create_table "accounts", force: :cascade do |t|
    t.string "username"
    t.string "password"
    t.integer "dog_owner_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "appointments", force: :cascade do |t|
    t.string "day"
    t.string "starting_time"
    t.integer "price"
    t.string "completion_status"
    t.integer "dog_owner_id"
    t.integer "dog_walker_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "month"
    t.integer "working_hours"
  end

  create_table "available_work_days", force: :cascade do |t|
    t.string "month"
    t.string "day"
    t.string "starting_time"
    t.integer "working_hours"
    t.integer "dog_walker_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "dog_owners", force: :cascade do |t|
    t.string "username"
    t.string "password"
    t.string "name"
    t.integer "phone_number"
    t.string "address"
  end

  create_table "dog_walkers", force: :cascade do |t|
    t.string "name"
    t.integer "phone_number"
    t.text "available_days"
    t.string "username"
    t.string "password"
    t.string "address"
  end

  create_table "reviews", force: :cascade do |t|
    t.string "content"
    t.integer "rating"
    t.integer "dog_owner_id"
    t.integer "dog_walker_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

end
