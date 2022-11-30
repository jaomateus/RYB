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

ActiveRecord::Schema[7.0].define(version: 2022_11_30_161201) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "logs", force: :cascade do |t|
    t.string "title"
    t.text "description"
    t.date "date"
    t.bigint "site_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["site_id"], name: "index_logs_on_site_id"
  end

  create_table "plants", force: :cascade do |t|
    t.string "latin_name"
    t.string "common_name"
    t.text "description"
    t.integer "hardiness"
    t.boolean "planted"
    t.integer "edibility_rate"
    t.boolean "well_drained"
    t.boolean "moist_soil"
    t.boolean "wet_soil"
    t.boolean "water_plant"
    t.boolean "full_sun"
    t.boolean "part_shade"
    t.boolean "full_shade"
    t.boolean "n_fixer"
    t.boolean "maritime_exposure"
    t.boolean "atmospheric_polution"
    t.integer "medicinal_rating"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "type"
    t.text "summary"
    t.float "width"
    t.float "height"
    t.string "family"
    t.integer "usa_hardiness_low"
    t.integer "usa_hardiness_high"
    t.text "habitats"
    t.text "range"
    t.boolean "weed_potential"
    t.text "physical_characteristics"
    t.text "edible_uses"
    t.text "medicinal_uses"
    t.text "cultivation_details"
    t.text "propagation_details"
  end

  create_table "plants_logs", force: :cascade do |t|
    t.bigint "log_id", null: false
    t.bigint "plant_id", null: false
    t.text "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["log_id"], name: "index_plants_logs_on_log_id"
    t.index ["plant_id"], name: "index_plants_logs_on_plant_id"
  end

  create_table "sites", force: :cascade do |t|
    t.string "project_name"
    t.text "description"
    t.string "address"
    t.string "project_type"
    t.float "project_area"
    t.float "latitude"
    t.float "longitude"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_sites_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "plants_logs", "logs"
  add_foreign_key "plants_logs", "plants"
end
