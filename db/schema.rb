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

ActiveRecord::Schema[7.1].define(version: 2024_09_30_065054) do
  create_table "entity_syncs", force: :cascade do |t|
    t.string "entity", null: false
    t.integer "establishment_id", null: false
    t.boolean "enable", default: false, null: false
    t.string "mapper_name"
    t.string "establishment_helper"
    t.string "conversion_hash_method"
    t.string "folder_path"
    t.string "csv_name"
    t.boolean "headers"
    t.string "col_sep"
    t.string "encoding"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["establishment_id"], name: "index_entity_syncs_on_establishment_id"
  end

  create_table "establishments", force: :cascade do |t|
    t.string "name"
    t.string "address"
    t.integer "phone"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "transaction_types", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "transactions", force: :cascade do |t|
    t.integer "work_day_id", null: false
    t.integer "transaction_type_id", null: false
    t.string "payment_type"
    t.float "amount"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["transaction_type_id"], name: "index_transactions_on_transaction_type_id"
    t.index ["work_day_id"], name: "index_transactions_on_work_day_id"
  end

  create_table "work_days", force: :cascade do |t|
    t.date "date"
    t.float "total"
    t.boolean "closed_shop"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "establishment_id", null: false
    t.index ["establishment_id"], name: "index_work_days_on_establishment_id"
  end

  add_foreign_key "transactions", "transaction_types"
  add_foreign_key "transactions", "work_days"
  add_foreign_key "work_days", "establishments"
end
