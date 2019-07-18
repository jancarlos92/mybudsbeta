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

ActiveRecord::Schema.define(version: 2019_07_15_193124) do

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

  create_table "dispensary_strains", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "strain_id"
    t.index ["strain_id"], name: "index_dispensary_strains_on_strain_id"
    t.index ["user_id"], name: "index_dispensary_strains_on_user_id"
  end

  create_table "friend_requests", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "friend_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["friend_id"], name: "index_friend_requests_on_friend_id"
    t.index ["user_id"], name: "index_friend_requests_on_user_id"
  end

  create_table "friendships", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "friend_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["friend_id"], name: "index_friendships_on_friend_id"
    t.index ["user_id"], name: "index_friendships_on_user_id"
  end

  create_table "galleries", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "photo_id"
    t.index ["photo_id"], name: "index_galleries_on_photo_id"
    t.index ["user_id"], name: "index_galleries_on_user_id"
  end

  create_table "photos", force: :cascade do |t|
    t.bigint "gallery_id"
    t.bigint "user_id"
    t.string "image"
    t.string "description"
    t.index ["gallery_id"], name: "index_photos_on_gallery_id"
    t.index ["user_id"], name: "index_photos_on_user_id"
  end

  create_table "strain_reviews", force: :cascade do |t|
    t.bigint "user_id"
    t.string "userPersonality"
    t.integer "mental"
    t.integer "physical"
    t.integer "velocity"
    t.integer "flavor"
    t.integer "overall"
    t.string "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "strain_id"
    t.index ["strain_id"], name: "index_strain_reviews_on_strain_id"
    t.index ["user_id"], name: "index_strain_reviews_on_user_id"
  end

  create_table "strains", force: :cascade do |t|
    t.string "avatar"
    t.string "strain_type"
    t.string "strain_name"
    t.string "location"
    t.string "description"
    t.integer "strain_reviews_count", default: 0
    t.integer "mental_indica_score", default: 0
    t.integer "physical_indica_score", default: 0
    t.integer "velocity_indica_score", default: 0
    t.integer "flavor_indica_score", default: 0
    t.integer "overall_indica_score", default: 0
    t.integer "mental_sativa_score", default: 0
    t.integer "physical_sativa_score", default: 0
    t.integer "velocity_sativa_score", default: 0
    t.integer "flavor_sativa_score", default: 0
    t.integer "overall_sativa_score", default: 0
    t.integer "mental_hybrid_score", default: 0
    t.integer "physical_hybrid_score", default: 0
    t.integer "velocity_hybrid_score", default: 0
    t.integer "flavor_hybrid_score", default: 0
    t.integer "overall_hybrid_score", default: 0
  end

  create_table "users", force: :cascade do |t|
    t.string "username"
    t.string "email"
    t.datetime "dob"
    t.string "location"
    t.string "personality_type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "bio"
    t.string "password_digest"
    t.boolean "dispensary", default: false
    t.boolean "dispensaryTAC", default: false
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "dispensary_strains", "strains"
  add_foreign_key "dispensary_strains", "users"
  add_foreign_key "friend_requests", "users"
  add_foreign_key "friendships", "users"
  add_foreign_key "galleries", "users"
  add_foreign_key "photos", "galleries"
  add_foreign_key "photos", "users"
  add_foreign_key "strain_reviews", "strains"
  add_foreign_key "strain_reviews", "users"
end
