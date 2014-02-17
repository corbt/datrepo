# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20140217203114) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_admin_comments", force: true do |t|
    t.string   "namespace"
    t.text     "body"
    t.string   "resource_id",   null: false
    t.string   "resource_type", null: false
    t.integer  "author_id"
    t.string   "author_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "active_admin_comments", ["author_type", "author_id"], name: "index_active_admin_comments_on_author_type_and_author_id", using: :btree
  add_index "active_admin_comments", ["namespace"], name: "index_active_admin_comments_on_namespace", using: :btree
  add_index "active_admin_comments", ["resource_type", "resource_id"], name: "index_active_admin_comments_on_resource_type_and_resource_id", using: :btree

  create_table "collections", force: true do |t|
    t.integer  "user_id"
    t.string   "title"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_favorite_collections_count", default: 0, null: false
  end

  add_index "collections", ["user_id"], name: "index_collections_on_user_id", using: :btree

  create_table "collections_datasets", id: false, force: true do |t|
    t.integer "collection_id", null: false
    t.integer "dataset_id",    null: false
  end

  add_index "collections_datasets", ["collection_id"], name: "index_collections_datasets_on_collection_id", using: :btree
  add_index "collections_datasets", ["dataset_id"], name: "index_collections_datasets_on_dataset_id", using: :btree

  create_table "datasets", force: true do |t|
    t.string   "path"
    t.integer  "records"
    t.decimal  "size"
    t.integer  "downloads"
    t.integer  "user_id"
    t.text     "custom_license"
    t.text     "description"
    t.string   "title"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "description_plaintext"
    t.integer  "user_favorite_datasets_count", default: 0, null: false
  end

  add_index "datasets", ["user_id"], name: "index_datasets_on_user_id", using: :btree

  create_table "users", force: true do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "username"
    t.boolean  "admin"
    t.string   "name"
    t.text     "about"
    t.string   "website"
  end

  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  add_index "users", ["username"], name: "index_users_on_username", unique: true, using: :btree

  create_table "users_favorite_collections", force: true do |t|
    t.integer "user_id",       null: false
    t.integer "collection_id", null: false
  end

  add_index "users_favorite_collections", ["collection_id"], name: "index_users_favorite_collections_on_collection_id", using: :btree
  add_index "users_favorite_collections", ["user_id"], name: "index_users_favorite_collections_on_user_id", using: :btree

  create_table "users_favorite_datasets", force: true do |t|
    t.integer "user_id",    null: false
    t.integer "dataset_id", null: false
  end

  add_index "users_favorite_datasets", ["dataset_id"], name: "index_users_favorite_datasets_on_dataset_id", using: :btree
  add_index "users_favorite_datasets", ["user_id"], name: "index_users_favorite_datasets_on_user_id", using: :btree

end
