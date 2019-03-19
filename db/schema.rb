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

ActiveRecord::Schema.define(version: 2019_03_13_141614) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "boxes", force: :cascade do |t|
    t.bigint "page_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "content_text"
    t.string "category"
    t.index ["page_id"], name: "index_boxes_on_page_id"
  end

  create_table "newspapers", force: :cascade do |t|
    t.bigint "tribe_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.date "published_on"
    t.index ["tribe_id"], name: "index_newspapers_on_tribe_id"
  end

  create_table "pages", force: :cascade do |t|
    t.bigint "newspaper_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "layout"
    t.string "number"
    t.index ["newspaper_id"], name: "index_pages_on_newspaper_id"
  end

  create_table "pictures", force: :cascade do |t|
    t.bigint "box_id"
    t.bigint "newspaper_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "photo"
    t.index ["box_id"], name: "index_pictures_on_box_id"
    t.index ["newspaper_id"], name: "index_pictures_on_newspaper_id"
  end

  create_table "tribes", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name"
    t.string "address"
    t.string "description"
    t.date "subscribed_on"
    t.string "photo"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "first_name"
    t.string "last_name"
    t.bigint "tribe_id"
    t.string "photo"
    t.string "invitation_token"
    t.datetime "invitation_created_at"
    t.datetime "invitation_sent_at"
    t.datetime "invitation_accepted_at"
    t.integer "invitation_limit"
    t.string "invited_by_type"
    t.bigint "invited_by_id"
    t.integer "invitations_count", default: 0
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["invitation_token"], name: "index_users_on_invitation_token", unique: true
    t.index ["invitations_count"], name: "index_users_on_invitations_count"
    t.index ["invited_by_id"], name: "index_users_on_invited_by_id"
    t.index ["invited_by_type", "invited_by_id"], name: "index_users_on_invited_by_type_and_invited_by_id"
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["tribe_id"], name: "index_users_on_tribe_id"
  end

  add_foreign_key "boxes", "pages"
  add_foreign_key "newspapers", "tribes"
  add_foreign_key "pages", "newspapers"
  add_foreign_key "pictures", "boxes"
  add_foreign_key "pictures", "newspapers"
  add_foreign_key "users", "tribes"
end
