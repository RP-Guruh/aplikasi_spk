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

ActiveRecord::Schema[7.0].define(version: 2023_05_20_061412) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "criteria_values", force: :cascade do |t|
    t.string "kriteria"
    t.string "keterangan"
    t.decimal "bobot_nilai"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "employee_values", force: :cascade do |t|
    t.string "NormalizedValue"
    t.string "NormalizationValue"
    t.string "TotalValue"
    t.string "PreferenceValue"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "employees", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.date "date_of_birth"
    t.string "gender"
    t.string "address"
    t.string "phone_number"
    t.string "email"
    t.string "position"
    t.string "department"
    t.string "employment_status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "normalization_weights", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "normalized_values", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "preference_values", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "kriteria", null: false
    t.string "keterangan", null: false
    t.decimal "bobot_nilai"
  end

  create_table "total_values", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
