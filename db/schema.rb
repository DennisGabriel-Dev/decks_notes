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

ActiveRecord::Schema[8.1].define(version: 2026_06_07_021142) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "pg_catalog.plpgsql"

  create_table "comments", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.text "description", null: false
    t.bigint "task_id", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id", null: false
    t.index ["task_id"], name: "index_comments_on_task_id"
    t.index ["user_id"], name: "index_comments_on_user_id"
  end

  create_table "notebooks", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.string "name"
    t.datetime "updated_at", null: false
    t.bigint "user_id", null: false
    t.index ["user_id"], name: "index_notebooks_on_user_id"
  end

  create_table "task_queues", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.string "name"
    t.bigint "notebook_id", null: false
    t.datetime "updated_at", null: false
    t.index ["notebook_id"], name: "index_task_queues_on_notebook_id"
  end

  create_table "tasks", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.text "description"
    t.integer "status"
    t.bigint "task_queue_id", null: false
    t.string "title"
    t.datetime "updated_at", null: false
    t.bigint "user_id"
    t.index ["task_queue_id"], name: "index_tasks_on_task_queue_id"
    t.index ["user_id"], name: "index_tasks_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.string "email"
    t.string "name"
    t.string "password"
    t.string "password_digest"
    t.datetime "updated_at", null: false
  end

  add_foreign_key "comments", "tasks"
  add_foreign_key "comments", "users"
  add_foreign_key "notebooks", "users"
  add_foreign_key "task_queues", "notebooks"
  add_foreign_key "tasks", "task_queues"
  add_foreign_key "tasks", "users"
end
