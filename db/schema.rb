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

ActiveRecord::Schema.define(version: 20150617031722) do

  create_table "answers", force: :cascade do |t|
    t.integer  "word_id",    null: false
    t.boolean  "is_true"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "categories", force: :cascade do |t|
    t.string   "title",       null: false
    t.string   "description"
    t.text     "content"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "lesson_words", force: :cascade do |t|
    t.integer  "lesson_id"
    t.integer  "word_id"
    t.integer  "answer_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "lesson_words", ["answer_id"], name: "index_lesson_words_on_answer_id"
  add_index "lesson_words", ["lesson_id"], name: "index_lesson_words_on_lesson_id"
  add_index "lesson_words", ["word_id"], name: "index_lesson_words_on_word_id"

  create_table "lessons", force: :cascade do |t|
    t.integer  "category_id", null: false
    t.integer  "user_id",     null: false
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "users", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "words", force: :cascade do |t|
    t.integer  "category_id", null: false
    t.string   "content",     null: false
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

end
