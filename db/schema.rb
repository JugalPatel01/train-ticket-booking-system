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

ActiveRecord::Schema[7.0].define(version: 2022_11_19_225602) do
  create_table "payments", force: :cascade do |t|
    t.string "type"
    t.string "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "places", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "schedules", force: :cascade do |t|
    t.string "sch_train_id"
    t.datetime "starting_time"
    t.datetime "reaching_time"
    t.integer "src_place_id"
    t.integer "dst_place_id"
    t.integer "tour_fare"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "train_id"
  end

  create_table "tickets", force: :cascade do |t|
    t.integer "sch_id"
    t.integer "u_id"
    t.integer "no_of_people"
    t.integer "total_amount"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "pay_id"
  end

  create_table "trains", force: :cascade do |t|
    t.string "train_name"
    t.integer "train_capacity"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "added_by_u_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "role", default: 1
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "first_name"
    t.string "last_name"
    t.string "mobile_no"
    t.string "gender"
    t.string "identity_proof_id"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
