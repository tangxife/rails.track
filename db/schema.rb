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

ActiveRecord::Schema[7.0].define(version: 2022_02_16_094738) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "candidates", force: :cascade do |t|
    t.string "cid", limit: 30
    t.string "name", null: false
    t.string "email", null: false
    t.string "area_code"
    t.string "phone"
    t.string "now_org_name"
    t.string "now_industry"
    t.string "memo", limit: 1000
    t.bigint "organization_id", null: false
    t.bigint "user_id", null: false
    t.integer "language", limit: 2, default: 0, null: false
    t.datetime "deleted_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["organization_id"], name: "index_candidates_on_organization_id"
    t.index ["user_id"], name: "index_candidates_on_user_id"
  end

  create_table "organizations", force: :cascade do |t|
    t.string "name", null: false
    t.string "email"
    t.string "tel"
    t.string "postal_code"
    t.string "address"
    t.string "contacts"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_organizations_on_name", unique: true
  end

  create_table "recommender_settings", force: :cascade do |t|
    t.bigint "reference_check_id"
    t.integer "relation", limit: 2
    t.integer "period", limit: 2
    t.integer "num", limit: 2
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["reference_check_id"], name: "index_recommender_settings_on_reference_check_id"
  end

  create_table "reference_checks", force: :cascade do |t|
    t.bigint "candidate_id"
    t.bigint "user_id"
    t.integer "progress", limit: 2, default: 0
    t.date "answer_deadline", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["candidate_id"], name: "index_reference_checks_on_candidate_id"
    t.index ["user_id"], name: "index_reference_checks_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.bigint "organization_id"
    t.string "provider", default: "email", null: false
    t.string "uid", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.boolean "allow_password_change", default: false
    t.datetime "remember_created_at"
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string "unconfirmed_email"
    t.string "name"
    t.string "nickname"
    t.string "image"
    t.string "email"
    t.string "phone"
    t.string "department"
    t.integer "role", limit: 2, null: false
    t.json "tokens"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.index ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["organization_id"], name: "index_users_on_organization_id"
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["uid", "provider"], name: "index_users_on_uid_and_provider", unique: true
  end

  add_foreign_key "candidates", "organizations"
  add_foreign_key "recommender_settings", "reference_checks"
  add_foreign_key "reference_checks", "candidates"
  add_foreign_key "reference_checks", "users"
  add_foreign_key "users", "organizations"
end
