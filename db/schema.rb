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

ActiveRecord::Schema.define(version: 20151025163626) do

  create_table "activities", force: :cascade do |t|
    t.integer  "trackable_id"
    t.string   "trackable_type"
    t.integer  "owner_id"
    t.string   "owner_type"
    t.string   "key"
    t.text     "parameters"
    t.integer  "recipient_id"
    t.string   "recipient_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "activities", ["owner_id", "owner_type"], name: "index_activities_on_owner_id_and_owner_type"
  add_index "activities", ["recipient_id", "recipient_type"], name: "index_activities_on_recipient_id_and_recipient_type"
  add_index "activities", ["trackable_id", "trackable_type"], name: "index_activities_on_trackable_id_and_trackable_type"

  create_table "authorizations", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "categories", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "convnetimage_results", force: :cascade do |t|
    t.string   "response"
    t.integer  "convnetimage_id"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.integer  "user_id"
  end

  add_index "convnetimage_results", ["convnetimage_id"], name: "index_convnetimage_results_on_convnetimage_id"
  add_index "convnetimage_results", ["user_id"], name: "index_convnetimage_results_on_user_id"

  create_table "convnetimages", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
    t.string   "iterations"
    t.integer  "user_id"
    t.string   "cover_file_name"
    t.string   "cover_content_type"
    t.integer  "cover_file_size"
    t.datetime "cover_updated_at"
    t.integer  "size"
    t.integer  "accuracy"
    t.string   "dataset_file_name"
    t.string   "dataset_content_type"
    t.integer  "dataset_file_size"
    t.datetime "dataset_updated_at"
    t.string   "snippet_file_name"
    t.string   "snippet_content_type"
    t.integer  "snippet_file_size"
    t.datetime "snippet_updated_at"
    t.string   "classifier_id"
  end

  add_index "convnetimages", ["user_id"], name: "index_convnetimages_on_user_id"

  create_table "datagalleries", force: :cascade do |t|
    t.string   "name"
    t.string   "organization"
    t.integer  "size"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
    t.string   "dataset_file_name"
    t.string   "dataset_content_type"
    t.integer  "dataset_file_size"
    t.datetime "dataset_updated_at"
    t.string   "snippet_file_name"
    t.string   "snippet_content_type"
    t.integer  "snippet_file_size"
    t.datetime "snippet_updated_at"
    t.integer  "category_id"
  end

  create_table "friendships", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "friend_id"
    t.string   "create"
    t.string   "destroy"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "granted_convnetimages_users", force: :cascade do |t|
    t.integer "user_id"
    t.integer "convnetimage_id"
  end

  add_index "granted_convnetimages_users", ["convnetimage_id"], name: "index_granted_convnetimages_users_on_convnetimage_id"
  add_index "granted_convnetimages_users", ["user_id"], name: "index_granted_convnetimages_users_on_user_id"

  create_table "granted_models_users", force: :cascade do |t|
    t.integer "user_id"
    t.integer "model_id"
  end

  add_index "granted_models_users", ["model_id"], name: "index_granted_models_users_on_model_id"
  add_index "granted_models_users", ["user_id"], name: "index_granted_models_users_on_user_id"

  create_table "granted_natlangs__users", force: :cascade do |t|
    t.integer "user_id"
    t.integer "natlang_id"
  end

  add_index "granted_natlangs__users", ["natlang_id"], name: "index_granted_natlangs__users_on_natlang_id"
  add_index "granted_natlangs__users", ["user_id"], name: "index_granted_natlangs__users_on_user_id"

  create_table "inputs", force: :cascade do |t|
    t.string   "name"
    t.string   "kind"
    t.integer  "model_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "order"
  end

  add_index "inputs", ["model_id"], name: "index_inputs_on_model_id"

  create_table "invitations", force: :cascade do |t|
    t.integer  "sender_id"
    t.string   "recipient_email"
    t.string   "token"
    t.datetime "sent_at"
    t.string   "new"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  create_table "models", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.string   "category"
    t.string   "city"
    t.string   "organization"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.integer  "user_id"
    t.string   "api_key"
    t.string   "endpoint"
    t.integer  "accuracy"
    t.string   "algorithm"
    t.integer  "size"
    t.string   "dataset_file_name"
    t.string   "dataset_content_type"
    t.integer  "dataset_file_size"
    t.datetime "dataset_updated_at"
    t.string   "snippet_file_name"
    t.string   "snippet_content_type"
    t.integer  "snippet_file_size"
    t.datetime "snippet_updated_at"
  end

  create_table "natlang_results", force: :cascade do |t|
    t.integer  "natlang_id"
    t.integer  "user_id"
    t.string   "value"
    t.string   "response"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "natlang_results", ["natlang_id"], name: "index_natlang_results_on_natlang_id"
  add_index "natlang_results", ["user_id"], name: "index_natlang_results_on_user_id"

  create_table "natlangs", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.integer  "classifier_id"
    t.integer  "accuracy"
    t.integer  "size"
    t.string   "organization"
    t.integer  "user_id"
    t.string   "dataset_file_name"
    t.string   "dataset_content_type"
    t.integer  "dataset_file_size"
    t.datetime "dataset_updated_at"
    t.string   "snippet_file_name"
    t.string   "snippet_content_type"
    t.integer  "snippet_file_size"
    t.datetime "snippet_updated_at"
  end

  create_table "outputs", force: :cascade do |t|
    t.integer  "model_id"
    t.string   "name"
    t.string   "kind"
    t.string   "default_value"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.integer  "order"
  end

  add_index "outputs", ["model_id"], name: "index_outputs_on_model_id"

  create_table "punches", force: :cascade do |t|
    t.integer  "punchable_id",                          null: false
    t.string   "punchable_type", limit: 20,             null: false
    t.datetime "starts_at",                             null: false
    t.datetime "ends_at",                               null: false
    t.datetime "average_time",                          null: false
    t.integer  "hits",                      default: 1, null: false
  end

  add_index "punches", ["average_time"], name: "index_punches_on_average_time"
  add_index "punches", ["punchable_type", "punchable_id"], name: "punchable_index"

  create_table "results", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "body"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "model_id"
  end

  add_index "results", ["model_id"], name: "index_results_on_model_id"
  add_index "results", ["user_id"], name: "index_results_on_user_id"

  create_table "upcomings", force: :cascade do |t|
    t.string   "name"
    t.string   "newdate"
    t.string   "state"
    t.string   "city"
    t.string   "modeltyp"
    t.string   "organization"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.string   "sauce"
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "",    null: false
    t.string   "encrypted_password",     default: "",    null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
    t.string   "name"
    t.boolean  "admin",                  default: false
    t.string   "oauth_token"
    t.datetime "oauth_expires_at"
    t.integer  "invitation_id"
    t.integer  "invitation_limit"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "provider"
    t.string   "uid"
  end

  add_index "users", ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true
  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["provider"], name: "index_users_on_provider"
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  add_index "users", ["uid"], name: "index_users_on_uid"

end
