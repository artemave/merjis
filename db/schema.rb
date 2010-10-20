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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20101020124710) do

  create_table "authentications", :force => true do |t|
    t.integer  "user_id"
    t.string   "uid"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "email"
  end

  create_table "crawls", :force => true do |t|
    t.integer  "website_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "openid_associations", :force => true do |t|
    t.datetime "issued_at"
    t.integer  "lifetime"
    t.string   "assoc_type"
    t.text     "handle"
    t.text     "secret"
    t.string   "target"
    t.text     "server_url"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "openid_nonces", :force => true do |t|
    t.integer  "timestamp"
    t.string   "salt"
    t.string   "target"
    t.text     "server_url"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "roles", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "roles_users", :id => false, :force => true do |t|
    t.integer "user_id"
    t.integer "role_id"
  end

  add_index "roles_users", ["role_id"], :name => "index_roles_users_on_role_id"
  add_index "roles_users", ["user_id"], :name => "index_roles_users_on_user_id"

  create_table "server_logs", :force => true do |t|
    t.integer  "website_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", :force => true do |t|
    t.string   "remember_token"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",       :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "email"
    t.string   "uid"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "username"
  end

  add_index "users", ["email"], :name => "index_users_on_email"
  add_index "users", ["uid"], :name => "index_users_on_uid", :unique => true
  add_index "users", ["username"], :name => "index_users_on_username"

  create_table "websites", :force => true do |t|
    t.string   "fqdn"
    t.string   "name"
    t.text     "description"
    t.boolean  "main",        :default => true
    t.boolean  "mobile",      :default => false
    t.boolean  "images",      :default => false
    t.boolean  "video",       :default => false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
  end

  add_index "websites", ["user_id"], :name => "index_websites_on_user_id"

end
