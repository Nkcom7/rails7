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

ActiveRecord::Schema[7.0].define(version: 2022_11_03_052030) do
  create_table "cost_details", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "name"
    t.integer "price"
    t.text "remark"
    t.bigint "cost_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["cost_id"], name: "index_cost_details_on_cost_id"
  end

  create_table "costs", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.date "date"
    t.bigint "costs_management_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["costs_management_id"], name: "index_costs_on_costs_management_id"
  end

  create_table "costs_managements", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "cost_file"
  end

  add_foreign_key "cost_details", "costs"
  add_foreign_key "costs", "costs_managements"
end
