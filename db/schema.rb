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

ActiveRecord::Schema.define(version: 20160110221408) do

  create_table "categories", force: :cascade do |t|
    t.string   "category_name"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  create_table "categories_projects", force: :cascade do |t|
    t.integer "category_id"
    t.integer "project_id"
  end

  create_table "organization_reviews", force: :cascade do |t|
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
    t.integer  "impact"
    t.integer  "participate_in_future_projects"
  end

  create_table "projects", force: :cascade do |t|
    t.string   "project_name"
    t.float    "difficulty"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "reviews", force: :cascade do |t|
    t.integer  "actable_id"
    t.string   "actable_type"
    t.integer  "project_id"
    t.integer  "user_id"
    t.string   "review_text"
    t.integer  "rating"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.integer  "feasibility"
  end

  create_table "student_reviews", force: :cascade do |t|
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
    t.integer  "learning_score"
    t.integer  "participate_in_future_projects"
    t.string   "participants"
    t.integer  "planning_score"
    t.string   "gender"
  end

  create_table "teacher_reviews", force: :cascade do |t|
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
    t.string   "course_name"
    t.integer  "grade_level"
    t.integer  "number_of_students"
    t.boolean  "community_participation"
    t.string   "description"
    t.integer  "duration"
    t.string   "preparation"
    t.string   "learning_standards"
    t.string   "cost"
    t.string   "reflection"
    t.integer  "learning_effectiveness"
  end

  create_table "users", force: :cascade do |t|
    t.string   "user_email"
    t.string   "user_name"
    t.string   "user_type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
