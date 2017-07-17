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

ActiveRecord::Schema.define(version: 20170717190007) do

  create_table "campaigns", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "contact_types", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "contacts", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "store_id"
    t.integer  "phone"
    t.datetime "date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["store_id"], name: "index_contacts_on_store_id", using: :btree
  end

  create_table "store_campaigns", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "campaign_id"
    t.string   "name"
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
    t.integer  "store_id"
    t.boolean  "sponsored_text_status"
    t.string   "sponsored_text"
    t.boolean  "campaign_text_status"
    t.string   "campaign_text"
    t.string   "media"
    t.boolean  "splashpage_status"
    t.integer  "contact_type_id"
    t.string   "splashimage"
    t.index ["campaign_id"], name: "index_store_campaigns_on_campaign_id", using: :btree
    t.index ["contact_type_id"], name: "index_store_campaigns_on_contact_type_id", using: :btree
    t.index ["store_id"], name: "index_store_campaigns_on_store_id", using: :btree
  end

  create_table "stores", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
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
    t.integer  "user_id"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "username"
    t.string   "key"
    t.string   "store_name"
    t.string   "activecamp"
    t.integer  "store_campaign_id"
    t.index ["email"], name: "index_stores_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_stores_on_reset_password_token", unique: true, using: :btree
    t.index ["store_campaign_id"], name: "index_stores_on_store_campaign_id", using: :btree
    t.index ["user_id"], name: "index_stores_on_user_id", using: :btree
  end

  create_table "users", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
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
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "username"
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  end

  add_foreign_key "contacts", "stores"
  add_foreign_key "store_campaigns", "campaigns"
  add_foreign_key "store_campaigns", "contact_types"
  add_foreign_key "store_campaigns", "stores"
  add_foreign_key "stores", "store_campaigns"
end
