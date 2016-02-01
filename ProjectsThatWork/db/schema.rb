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

ActiveRecord::Schema.define(version: 20160131231011) do

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
    t.integer  "impact"
    t.integer  "participate_in_future_projects"
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
  end

  create_table "project_instances", force: :cascade do |t|
    t.integer  "project_id"
    t.integer  "user_id"
    t.string   "school"
    t.string   "town"
    t.string   "course"
    t.integer  "grade_level"
    t.integer  "number_of_students"
    t.datetime "start_date"
    t.datetime "end_date"
    t.string   "materials_and_costs"
    t.string   "learning_goals"
    t.boolean  "community_participation"
    t.string   "community_partners"
    t.string   "steps"
    t.string   "preparation"
    t.string   "reflection_activities"
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  create_table "projects", force: :cascade do |t|
    t.string   "project_name"
    t.string   "course_subject"
    t.string   "description"
    t.string   "expected_difficulty"
    t.integer  "duration"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
  end

  create_table "reviews", force: :cascade do |t|
    t.integer  "actable_id"
    t.string   "actable_type"
    t.string   "review_text"
    t.integer  "rating"
    t.integer  "feasibility"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
    t.integer  "project_id"
    t.integer  "project_instance_id"
  end

  create_table "student_reviews", force: :cascade do |t|
    t.integer  "learning_score"
    t.integer  "participate_in_future_projects"
    t.string   "participants"
    t.string   "planning_score"
    t.string   "gender"
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
  end

  create_table "teacher_reviews", force: :cascade do |t|
    t.integer  "learning_effectiveness"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "user_email"
    t.string   "user_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
