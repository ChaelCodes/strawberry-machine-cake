# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2018_11_27_170347) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.bigint "byte_size", null: false
    t.string "checksum", null: false
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "characters", force: :cascade do |t|
    t.text "display_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "color"
    t.string "handle"
    t.string "state", default: "active"
    t.integer "version"
    t.bigint "previous_character_id"
    t.index ["previous_character_id"], name: "index_characters_on_previous_character_id"
  end

  create_table "characters_scenarios", id: false, force: :cascade do |t|
    t.bigint "character_id", null: false
    t.bigint "scenario_id", null: false
    t.index ["character_id"], name: "index_characters_scenarios_on_character_id"
    t.index ["scenario_id"], name: "index_characters_scenarios_on_scenario_id"
  end

  create_table "likes", force: :cascade do |t|
    t.bigint "character_id"
    t.bigint "pix_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["character_id"], name: "index_likes_on_character_id"
    t.index ["pix_id"], name: "index_likes_on_pix_id"
  end

  create_table "pixes", force: :cascade do |t|
    t.text "msg"
    t.bigint "character_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "scenario_id"
    t.index ["character_id"], name: "index_pixes_on_character_id"
    t.index ["scenario_id"], name: "index_pixes_on_scenario_id"
  end

  create_table "scenarios", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "admin"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "characters", "characters", column: "previous_character_id"
  add_foreign_key "likes", "characters"
  add_foreign_key "likes", "pixes"
  add_foreign_key "pixes", "scenarios"
end
