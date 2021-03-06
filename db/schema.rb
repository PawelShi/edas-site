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

ActiveRecord::Schema.define(version: 20150409052905) do

  create_table "microposts", force: true do |t|
    t.date     "start_dt"
    t.string   "title"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "content"
  end

  create_table "projects", force: true do |t|
    t.string   "name",       limit: 100
    t.text     "body"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "imgurl"
  end

  add_index "projects", ["name"], name: "index_projects_on_name", unique: true

  create_table "projects_tags", id: false, force: true do |t|
    t.integer "project_id"
    t.integer "tag_id"
  end

  add_index "projects_tags", ["project_id"], name: "index_projects_tags_on_project_id"
  add_index "projects_tags", ["tag_id"], name: "index_projects_tags_on_tag_id"

  create_table "services", force: true do |t|
    t.string   "name",       limit: 30
    t.text     "content"
    t.integer  "sort"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "services", ["name"], name: "index_services_on_name", unique: true

  create_table "siteconfigs", force: true do |t|
    t.string   "name",       limit: 50
    t.text     "value"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "tags", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "name"
    t.string   "email"
    t.integer  "role_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
