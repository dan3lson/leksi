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

ActiveRecord::Schema.define(version: 20150910125259) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "game_levels", force: :cascade do |t|
    t.integer  "game_id",    null: false
    t.integer  "level_id",   null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "game_levels", ["game_id", "level_id"], name: "index_game_levels_on_game_id_and_level_id", using: :btree
  add_index "game_levels", ["game_id"], name: "index_game_levels_on_game_id", using: :btree
  add_index "game_levels", ["level_id"], name: "index_game_levels_on_level_id", using: :btree

  create_table "games", force: :cascade do |t|
    t.string   "name",        null: false
    t.text     "description", null: false
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "levels", force: :cascade do |t|
    t.string   "focus",      null: false
    t.string   "direction",  null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "reviews", force: :cascade do |t|
    t.integer  "rating",      null: false
    t.text     "description"
    t.integer  "user_id",     null: false
    t.integer  "version_id",  null: false
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "reviews", ["rating"], name: "index_reviews_on_rating", using: :btree
  add_index "reviews", ["user_id", "version_id"], name: "index_reviews_on_user_id_and_version_id", unique: true, using: :btree
  add_index "reviews", ["user_id"], name: "index_reviews_on_user_id", using: :btree
  add_index "reviews", ["version_id"], name: "index_reviews_on_version_id", using: :btree

  create_table "tags", force: :cascade do |t|
    t.string   "name",       null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "tags", ["name"], name: "index_tags_on_name", unique: true, using: :btree

  create_table "user_tags", force: :cascade do |t|
    t.integer  "user_id",    null: false
    t.integer  "tag_id",     null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "user_tags", ["tag_id"], name: "index_user_tags_on_tag_id", using: :btree
  add_index "user_tags", ["user_id", "tag_id"], name: "index_user_tags_on_user_id_and_tag_id", unique: true, using: :btree
  add_index "user_tags", ["user_id"], name: "index_user_tags_on_user_id", using: :btree

  create_table "user_word_game_levels", force: :cascade do |t|
    t.integer  "user_word_id",                          null: false
    t.integer  "game_level_id",                         null: false
    t.string   "status",        default: "not started", null: false
    t.datetime "created_at",                            null: false
    t.datetime "updated_at",                            null: false
  end

  create_table "user_word_tags", force: :cascade do |t|
    t.integer  "word_tag_id", null: false
    t.integer  "user_id",     null: false
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "user_word_tags", ["user_id", "word_tag_id"], name: "index_user_word_tags_on_user_id_and_word_tag_id", unique: true, using: :btree
  add_index "user_word_tags", ["user_id"], name: "index_user_word_tags_on_user_id", using: :btree
  add_index "user_word_tags", ["word_tag_id"], name: "index_user_word_tags_on_word_tag_id", using: :btree

  create_table "user_words", force: :cascade do |t|
    t.integer  "user_id",    null: false
    t.integer  "word_id",    null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "user_words", ["user_id", "word_id"], name: "index_user_words_on_user_id_and_word_id", unique: true, using: :btree
  add_index "user_words", ["user_id"], name: "index_user_words_on_user_id", using: :btree
  add_index "user_words", ["word_id"], name: "index_user_words_on_word_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "username",                             null: false
    t.string   "password_digest"
    t.datetime "created_at",                           null: false
    t.datetime "updated_at",                           null: false
    t.string   "role",            default: "brainiac", null: false
    t.integer  "points",          default: 0,          null: false
    t.datetime "last_login"
    t.integer  "goal"
  end

  add_index "users", ["username"], name: "index_users_on_username", unique: true, using: :btree

  create_table "versions", force: :cascade do |t|
    t.string   "number",      null: false
    t.text     "description", null: false
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "versions", ["number"], name: "index_versions_on_number", unique: true, using: :btree

  create_table "word_antonyms", force: :cascade do |t|
    t.integer  "word_id",    null: false
    t.integer  "antonym_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "word_antonyms", ["antonym_id"], name: "index_word_antonyms_on_antonym_id", using: :btree
  add_index "word_antonyms", ["word_id", "antonym_id"], name: "index_word_antonyms_on_word_id_and_antonym_id", unique: true, using: :btree
  add_index "word_antonyms", ["word_id"], name: "index_word_antonyms_on_word_id", using: :btree

  create_table "word_synonyms", force: :cascade do |t|
    t.integer  "word_id",    null: false
    t.integer  "synonym_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "word_synonyms", ["synonym_id"], name: "index_word_synonyms_on_synonym_id", using: :btree
  add_index "word_synonyms", ["word_id", "synonym_id"], name: "index_word_synonyms_on_word_id_and_synonym_id", unique: true, using: :btree
  add_index "word_synonyms", ["word_id"], name: "index_word_synonyms_on_word_id", using: :btree

  create_table "word_tags", force: :cascade do |t|
    t.integer  "word_id",    null: false
    t.integer  "tag_id",     null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "word_tags", ["tag_id"], name: "index_word_tags_on_tag_id", using: :btree
  add_index "word_tags", ["word_id", "tag_id"], name: "index_word_tags_on_word_id_and_tag_id", unique: true, using: :btree
  add_index "word_tags", ["word_id"], name: "index_word_tags_on_word_id", using: :btree

  create_table "words", force: :cascade do |t|
    t.string   "definition",        null: false
    t.string   "phonetic_spelling"
    t.string   "part_of_speech"
    t.string   "name",              null: false
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
    t.string   "example_sentence"
  end

  add_index "words", ["name", "definition"], name: "index_words_on_name_and_definition", using: :btree
  add_index "words", ["name"], name: "index_words_on_name", using: :btree

end
