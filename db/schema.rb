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

ActiveRecord::Schema.define(version: 2023_07_04_041725) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "artists", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "email"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "categories", primary_key: "category_id", id: :integer, default: nil, force: :cascade do |t|
    t.string "category_name", limit: 255
  end

  create_table "items", force: :cascade do |t|
    t.string "title"
    t.text "description"
    t.string "image_url"
    t.bigint "artist_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["artist_id"], name: "index_items_on_artist_id"
  end

  create_table "tasks", primary_key: "task_id", id: :serial, force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "cat_id", null: false
    t.integer "priority", default: 0
    t.string "title", limit: 255, null: false
    t.datetime "task_due"
    t.boolean "is_completed", default: false
    t.datetime "created_date"
    t.datetime "completed_date"
    t.check_constraint "(priority >= 0) AND (priority <= 5)", name: "tasks_priority_check"
  end

  create_table "users", id: :serial, force: :cascade do |t|
    t.string "name", limit: 255, null: false
    t.string "password", limit: 255
    t.string "email", limit: 255
  end

  add_foreign_key "items", "artists"
  add_foreign_key "tasks", "categories", column: "cat_id", primary_key: "category_id", name: "tasks_cat_id_fkey"
  add_foreign_key "tasks", "users", name: "tasks_user_id_fkey"
end
