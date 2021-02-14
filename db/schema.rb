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

ActiveRecord::Schema.define(version: 2021_02_13_000000) do

  create_table "identities", charset: "utf8", force: :cascade do |t|
    t.bigint "user_id"
    t.string "provider"
    t.string "uid"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_identities_on_user_id"
  end

  create_table "lists", charset: "utf8", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "slug"
    t.bigint "stack_id"
    t.datetime "deleted_at"
    t.bigint "owner_id"
    t.integer "sort_order"
    t.index ["owner_id"], name: "fk_rails_3884c760f7"
  end

  create_table "lists_users", id: false, charset: "utf8", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "list_id", null: false
    t.index ["list_id", "user_id"], name: "index_lists_users_on_list_id_and_user_id", unique: true
    t.index ["user_id", "list_id"], name: "index_lists_users_on_user_id_and_list_id"
  end

  create_table "stacks", charset: "utf8", force: :cascade do |t|
    t.string "token"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "stats", charset: "utf8", force: :cascade do |t|
    t.integer "tasks_count"
    t.integer "lists_count"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "tasks", charset: "utf8", force: :cascade do |t|
    t.string "description"
    t.boolean "completed", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "list_id"
    t.integer "sort_order"
    t.datetime "deleted_at"
  end

  create_table "users", charset: "utf8", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "api_token"
    t.string "image_url"
    t.index ["email"], name: "index_users_on_email"
  end

  add_foreign_key "identities", "users"
  add_foreign_key "lists", "users", column: "owner_id"
end
