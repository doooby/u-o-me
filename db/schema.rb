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

ActiveRecord::Schema[7.1].define(version: 2024_06_27_040001) do
  create_table "invoices", force: :cascade do |t|
    t.integer "user_id"
    t.string "buyer_email"
    t.string "buyer_name"
    t.string "buyer_address"
    t.string "buyer_phone"
    t.date "due_date"
    t.integer "price_amount"
    t.text "note"
    t.string "public_slug"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_invoices_on_user_id"
  end

  create_table "reminders", force: :cascade do |t|
    t.integer "invoice_id"
    t.datetime "created_at"
    t.text "message_html"
    t.index ["invoice_id"], name: "index_reminders_on_invoice_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", null: false
    t.string "name"
    t.string "users"
    t.string "password_digest"
    t.string "privileges"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
  end

  add_foreign_key "invoices", "users"
  add_foreign_key "reminders", "invoices"
end
