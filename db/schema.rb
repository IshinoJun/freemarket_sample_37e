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

ActiveRecord::Schema.define(version: 20190227040232) do

  create_table "addresses", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "postcode",                    null: false
    t.string   "prefectures",                 null: false
    t.string   "municipality",                null: false
    t.string   "street_number",               null: false
    t.string   "building_name"
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
    t.integer  "room_number"
    t.text     "remarks",       limit: 65535
    t.integer  "user_id",                     null: false
    t.index ["user_id"], name: "index_addresses_on_user_id", using: :btree
  end

  create_table "brands", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string  "name"
    t.integer "item_id", null: false
    t.index ["item_id"], name: "index_brands_on_item_id", using: :btree
  end

  create_table "cards", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "user_id",         null: false
    t.string   "name",            null: false
    t.integer  "card_number",     null: false
    t.date     "expiration_date", null: false
    t.integer  "security_code",   null: false
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.index ["user_id"], name: "index_cards_on_user_id", using: :btree
  end

  create_table "categories", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "name",     null: false
    t.string "ancestry"
    t.index ["ancestry"], name: "index_categories_on_ancestry", using: :btree
  end

  create_table "categories_groups", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "item_id"
    t.integer  "category_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["category_id"], name: "index_categoriegroups_on_category_id", using: :btree
    t.index ["item_id"], name: "index_categoriegroups_on_item_id", using: :btree
  end

  create_table "comments", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "user_id",                  null: false
    t.integer  "item_id",                  null: false
    t.text     "text",       limit: 65535, null: false
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
    t.index ["item_id"], name: "index_comments_on_item_id", using: :btree
    t.index ["user_id"], name: "index_comments_on_user_id", using: :btree
  end

  create_table "images", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "item_id",    null: false
    t.string   "image_url",  null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["item_id"], name: "index_images_on_item_id", using: :btree
  end

  create_table "items", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name",                          null: false
    t.integer  "price",                         null: false
    t.integer  "item_condition",                null: false
    t.string   "area",                          null: false
    t.integer  "shipping_method",               null: false
    t.string   "size"
    t.text     "text",            limit: 65535, null: false
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
    t.integer  "seller_id",                     null: false
    t.integer  "buyer_id"
    t.integer  "delivery_date",                 null: false
    t.integer  "delivery_burden",               null: false
    t.index ["buyer_id"], name: "index_items_on_buyer_id", using: :btree
    t.index ["seller_id"], name: "index_items_on_seller_id", using: :btree
  end

  create_table "users", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "nickname",                            null: false
    t.string   "family_name",                         null: false
    t.string   "first_name",                          null: false
    t.string   "family_name_kana",                    null: false
    t.string   "first_name_kana",                     null: false
    t.string   "telephone"
    t.date     "birthday",                            null: false
    t.string   "icon"
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "rate_good",              default: 0
    t.integer  "rate_normal",            default: 0
    t.integer  "rate_bad",               default: 0
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  end

  add_foreign_key "addresses", "users"
  add_foreign_key "brands", "items"
  add_foreign_key "cards", "users"
  add_foreign_key "categories_groups", "categories"
  add_foreign_key "categories_groups", "items"
  add_foreign_key "comments", "items"
  add_foreign_key "comments", "users"
  add_foreign_key "images", "items"
end
