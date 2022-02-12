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

ActiveRecord::Schema[7.0].define(version: 2022_02_12_204648) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "candidates", force: :cascade do |t|
    t.string "cid", limit: 30
    t.string "name", null: false
    t.string "email", null: false
    t.string "area_code"
    t.string "phone"
    t.string "now_rog_name"
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

end
