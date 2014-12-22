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

ActiveRecord::Schema.define(version: 20141222140529) do

  create_table "accounts", force: :cascade do |t|
    t.integer  "user_id",    limit: 4
    t.string   "name",       limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "authentications", force: :cascade do |t|
    t.integer  "user_id",    limit: 4
    t.string   "uid",        limit: 255
    t.string   "provider",   limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "bandit_choices", force: :cascade do |t|
    t.integer "build_id",         limit: 4
    t.integer "normal_choice",    limit: 4
    t.integer "cruel_choice",     limit: 4
    t.integer "merciless_choice", limit: 4
    t.text    "alternatives",     limit: 65535
  end

  create_table "broadcasts", force: :cascade do |t|
    t.string   "title",      limit: 255
    t.string   "body",       limit: 255
    t.integer  "priority",   limit: 4
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "build_classes", force: :cascade do |t|
    t.integer  "build_id",   limit: 4
    t.integer  "klass_id",   limit: 4
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "build_keystones", force: :cascade do |t|
    t.integer "build_id",    limit: 4
    t.integer "keystone_id", limit: 4
  end

  create_table "build_leagues", force: :cascade do |t|
    t.integer  "build_id",   limit: 4
    t.integer  "league_id",  limit: 4
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "build_searches", force: :cascade do |t|
    t.string   "uid",           limit: 255
    t.integer  "user_id",       limit: 4
    t.integer  "build_id",      limit: 4
    t.string   "order",         limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "keywords",      limit: 255
    t.integer  "life_type",     limit: 4
    t.boolean  "softcore",      limit: 1,   default: true
    t.boolean  "hardcore",      limit: 1,   default: true
    t.string   "skill_gem_ids", limit: 255
    t.string   "unique_ids",    limit: 255
    t.string   "klass_ids",     limit: 255
    t.string   "keystone_ids",  limit: 255
    t.boolean  "pvp",           limit: 1,   default: false
    t.integer  "user_uid",      limit: 4
  end

  add_index "build_searches", ["uid"], name: "index_build_searches_on_uid", using: :btree

  create_table "build_uniques", force: :cascade do |t|
    t.integer "build_id",  limit: 4
    t.integer "unique_id", limit: 4
  end

  create_table "builds", force: :cascade do |t|
    t.integer  "user_id",        limit: 4
    t.string   "title",          limit: 255
    t.text     "summary",        limit: 65535
    t.text     "description",    limit: 65535
    t.string   "video_url",      limit: 255
    t.integer  "life_type",      limit: 4
    t.integer  "playstyle",      limit: 4
    t.integer  "role",           limit: 4
    t.boolean  "pvp",            limit: 1
    t.string   "version",        limit: 255
    t.boolean  "indexed",        limit: 1
    t.boolean  "certified",      limit: 1
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "published_at"
    t.boolean  "softcore",       limit: 1,     default: true
    t.boolean  "hardcore",       limit: 1,     default: true
    t.text     "gearing_advice", limit: 65535
    t.text     "conclusion",     limit: 65535
    t.integer  "up_votes",       limit: 4,     default: 0,    null: false
    t.integer  "down_votes",     limit: 4,     default: 0,    null: false
    t.integer  "views",          limit: 4,     default: 0
  end

  create_table "exile_searches", force: :cascade do |t|
    t.string   "uid",        limit: 255
    t.string   "keywords",   limit: 255
    t.string   "unique_ids", limit: 255
    t.string   "klass_ids",  limit: 255
    t.integer  "user_id",    limit: 4
    t.integer  "user_uid",   limit: 4
    t.string   "order",      limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "exile_uniques", force: :cascade do |t|
    t.integer  "unique_id",  limit: 4
    t.integer  "exile_id",   limit: 4
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "exiles", force: :cascade do |t|
    t.string   "name",             limit: 255
    t.text     "tagline",          limit: 65535
    t.text     "description",      limit: 65535
    t.integer  "views",            limit: 4
    t.integer  "user_id",          limit: 4
    t.integer  "klass_id",         limit: 4
    t.string   "video_uid",        limit: 255
    t.string   "album_uid",        limit: 255
    t.text     "cached_photos",    limit: 65535
    t.text     "items",            limit: 65535
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "up_votes",         limit: 4,     default: 0, null: false
    t.integer  "down_votes",       limit: 4,     default: 0, null: false
    t.text     "gear_description", limit: 65535
  end

  create_table "fast_searches", force: :cascade do |t|
    t.string   "uid",        limit: 255
    t.text     "query",      limit: 65535
    t.integer  "user_id",    limit: 4
    t.integer  "league_id",  limit: 4
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  create_table "favoriteds", force: :cascade do |t|
    t.integer  "search_id",  limit: 4
    t.integer  "user_id",    limit: 4
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "forum_threads", force: :cascade do |t|
    t.string   "account",         limit: 255
    t.string   "items_md5",       limit: 255
    t.text     "item_store",      limit: 16777215
    t.integer  "uid",             limit: 4
    t.integer  "league_id",       limit: 4
    t.datetime "last_updated_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "gear_gems", force: :cascade do |t|
    t.integer "gear_id",      limit: 4
    t.integer "skill_gem_id", limit: 4
  end

  create_table "gears", force: :cascade do |t|
    t.string   "name",            limit: 255
    t.string   "description",     limit: 255
    t.integer  "gear_gems_count", limit: 4
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "build_id",        limit: 4
    t.boolean  "main",            limit: 1,   default: false
  end

  create_table "item_types", force: :cascade do |t|
    t.string "name", limit: 255
  end

  add_index "item_types", ["name"], name: "index_item_types_on_name", using: :btree

  create_table "items", force: :cascade do |t|
    t.integer  "league_id",              limit: 4
    t.integer  "rarity_id",              limit: 4
    t.string   "name",                   limit: 255,                   null: false
    t.string   "base_name",              limit: 255
    t.string   "account",                limit: 255
    t.text     "socket_store",           limit: 65535
    t.integer  "quality",                limit: 4
    t.integer  "block_chance",           limit: 4
    t.integer  "armour",                 limit: 4
    t.integer  "evasion",                limit: 4
    t.integer  "energy_shield",          limit: 4
    t.integer  "physical_damage",        limit: 4
    t.integer  "dps",                    limit: 4
    t.float    "critical_strike_chance", limit: 24
    t.float    "aps",                    limit: 24
    t.integer  "level",                  limit: 4
    t.string   "requirements",           limit: 255
    t.string   "type",                   limit: 255
    t.string   "price",                  limit: 255
    t.string   "thread_id",              limit: 255
    t.boolean  "verified",               limit: 1
    t.boolean  "identified",             limit: 1
    t.datetime "indexed_at"
    t.string   "icon",                   limit: 255
    t.text     "raw_icon",               limit: 65535
    t.string   "uid",                    limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "size",                   limit: 255
    t.date     "thread_updated_at"
    t.string   "league_name",            limit: 255
    t.string   "rarity_name",            limit: 255
    t.integer  "elemental_damage",       limit: 4
    t.integer  "sold",                   limit: 4,     default: 0
    t.string   "display_stats",          limit: 255
    t.string   "socket_combination",     limit: 255
    t.boolean  "corrupted",              limit: 1,     default: false
  end

  add_index "items", ["uid", "thread_id"], name: "index_items_on_uid_and_thread_id", using: :btree

  create_table "keystones", force: :cascade do |t|
    t.string  "name",        limit: 255
    t.text    "description", limit: 65535
    t.string  "icon",        limit: 255
    t.integer "uid",         limit: 4
  end

  create_table "klasses", force: :cascade do |t|
    t.string   "name",        limit: 255
    t.string   "description", limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "leagues", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "permanent",  limit: 1,   default: false
    t.boolean  "hardcore",   limit: 1,   default: false
  end

  add_index "leagues", ["name"], name: "index_leagues_on_name", using: :btree

  create_table "messages", force: :cascade do |t|
    t.string   "title",        limit: 255
    t.text     "body",         limit: 65535
    t.integer  "sender_id",    limit: 4
    t.integer  "recipient_id", limit: 4
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "contact_info", limit: 255
  end

  create_table "mod_item_types", force: :cascade do |t|
    t.integer "mod_id",       limit: 4
    t.integer "item_type_id", limit: 4
    t.string  "mod_group",    limit: 255
  end

  add_index "mod_item_types", ["item_type_id"], name: "index_mod_item_types_on_item_type_id", using: :btree
  add_index "mod_item_types", ["mod_id"], name: "index_mod_item_types_on_mod_id", using: :btree

  create_table "mods", force: :cascade do |t|
    t.string   "name",       limit: 255, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "mods", ["name"], name: "index_mods_on_name", using: :btree

  create_table "players", force: :cascade do |t|
    t.integer  "league_id",        limit: 4
    t.boolean  "online",           limit: 1,   default: false
    t.string   "account",          limit: 255
    t.string   "character",        limit: 255
    t.datetime "marked_online_at"
    t.datetime "last_online"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "players", ["account", "league_id"], name: "index_players_on_account_and_league_id", using: :btree
  add_index "players", ["account"], name: "index_players_on_account", using: :btree
  add_index "players", ["character", "league_id"], name: "index_players_on_character_and_league_id", using: :btree

  create_table "rarities", force: :cascade do |t|
    t.string   "name",       limit: 255, null: false
    t.integer  "frame_type", limit: 4
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "rarities", ["name"], name: "index_rarities_on_name", using: :btree

  create_table "scrawls", force: :cascade do |t|
    t.integer  "thread_count", limit: 4
    t.integer  "item_count",   limit: 4
    t.boolean  "successful",   limit: 1
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "search_stats", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.integer  "search_id",  limit: 4
    t.integer  "mod_id",     limit: 4
    t.integer  "value",      limit: 4
    t.integer  "max_value",  limit: 4
    t.boolean  "required",   limit: 1,   default: false
    t.boolean  "excluded",   limit: 1,   default: false
    t.boolean  "gte",        limit: 1,   default: false
    t.boolean  "lte",        limit: 1,   default: false
    t.boolean  "implicit",   limit: 1,   default: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "search_stats", ["search_id"], name: "index_search_stats_on_search_id", using: :btree

  create_table "searches", force: :cascade do |t|
    t.integer  "user_id",                 limit: 4
    t.integer  "item_id",                 limit: 4
    t.string   "item_type",               limit: 255
    t.integer  "league_id",               limit: 4
    t.integer  "str",                     limit: 4
    t.integer  "max_str",                 limit: 4
    t.integer  "int",                     limit: 4
    t.integer  "max_int",                 limit: 4
    t.integer  "dex",                     limit: 4
    t.integer  "max_dex",                 limit: 4
    t.string   "uid",                     limit: 255
    t.string   "account",                 limit: 255
    t.string   "full_name",               limit: 255
    t.string   "name",                    limit: 255
    t.string   "base_name",               limit: 255
    t.string   "currency",                limit: 255
    t.string   "socket_combination",      limit: 255
    t.string   "thread_id",               limit: 255
    t.string   "quality",                 limit: 255
    t.float    "dps",                     limit: 24
    t.float    "max_dps",                 limit: 24
    t.float    "physical_dps",            limit: 24
    t.float    "max_physical_dps",        limit: 24
    t.float    "aps",                     limit: 24
    t.float    "csc",                     limit: 24
    t.float    "price_value",             limit: 24
    t.float    "max_price_value",         limit: 24
    t.integer  "physical_damage",         limit: 4
    t.integer  "max_physical_damage",     limit: 4
    t.integer  "elemental_damage",        limit: 4
    t.integer  "max_elemental_damage",    limit: 4
    t.integer  "block_chance",            limit: 4
    t.integer  "max_block_chance",        limit: 4
    t.integer  "armour",                  limit: 4
    t.integer  "max_armour",              limit: 4
    t.integer  "evasion",                 limit: 4
    t.integer  "max_evasion",             limit: 4
    t.integer  "energy_shield",           limit: 4
    t.integer  "max_energy_shield",       limit: 4
    t.integer  "rarity_id",               limit: 4
    t.integer  "socket_count",            limit: 4
    t.integer  "max_socket_count",        limit: 4
    t.integer  "linked_socket_count",     limit: 4
    t.integer  "max_linked_socket_count", limit: 4
    t.integer  "level",                   limit: 4
    t.integer  "max_level",               limit: 4
    t.boolean  "has_price",               limit: 1,   default: false
    t.boolean  "same_item_type",          limit: 1
    t.boolean  "corrupted",               limit: 1
    t.boolean  "online",                  limit: 1,   default: false
    t.string   "order",                   limit: 255
    t.string   "type",                    limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "minimum_mod_match",       limit: 4,   default: 0
    t.integer  "order_by_mod_id",         limit: 4
    t.boolean  "sort_by_price",           limit: 1,   default: false
    t.float    "edps",                    limit: 24
    t.float    "max_edps",                limit: 24
    t.float    "max_aps",                 limit: 24
    t.float    "max_csc",                 limit: 24
    t.integer  "max_quality",             limit: 4
  end

  add_index "searches", ["uid"], name: "index_searches_on_uid", using: :btree

  create_table "skill_gems", force: :cascade do |t|
    t.string   "name",        limit: 255
    t.string   "description", limit: 255
    t.string   "attr",        limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "support",     limit: 1,   default: false
  end

  create_table "skill_trees", force: :cascade do |t|
    t.integer  "build_id",    limit: 4
    t.text     "url",         limit: 65535
    t.text     "description", limit: 65535
    t.integer  "level",       limit: 4
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "stats", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.integer  "item_id",    limit: 4
    t.integer  "mod_id",     limit: 4
    t.integer  "value",      limit: 4
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "hidden",     limit: 1,   default: false
    t.boolean  "implicit",   limit: 1,   default: false
  end

  add_index "stats", ["item_id"], name: "index_stats_on_item_id", using: :btree

  create_table "uniques", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.string   "base_item",  limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "image_url",  limit: 255
  end

  create_table "user_favorites", force: :cascade do |t|
    t.integer  "user_id",    limit: 4
    t.integer  "item_id",    limit: 4
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: :cascade do |t|
    t.string   "login",                    limit: 255,                        null: false
    t.string   "bio",                      limit: 255
    t.string   "forum_token",              limit: 255
    t.string   "email",                    limit: 255,   default: "",         null: false
    t.string   "encrypted_password",       limit: 255,   default: "",         null: false
    t.string   "reset_password_token",     limit: 255
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",            limit: 4,     default: 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip",       limit: 255
    t.string   "last_sign_in_ip",          limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "role",                     limit: 255,   default: "verified"
    t.string   "avatar",                   limit: 255
    t.text     "cached_favorite_item_ids", limit: 65535
    t.integer  "league_id",                limit: 4
    t.string   "league_name",              limit: 255
    t.integer  "up_votes",                 limit: 4,     default: 0,          null: false
    t.integer  "down_votes",               limit: 4,     default: 0,          null: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  create_table "votings", force: :cascade do |t|
    t.string   "voteable_type", limit: 255
    t.integer  "voteable_id",   limit: 4
    t.string   "voter_type",    limit: 255
    t.integer  "voter_id",      limit: 4
    t.boolean  "up_vote",       limit: 1,   null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "votings", ["voteable_type", "voteable_id", "voter_type", "voter_id"], name: "unique_voters", unique: true, using: :btree
  add_index "votings", ["voteable_type", "voteable_id"], name: "index_votings_on_voteable_type_and_voteable_id", using: :btree
  add_index "votings", ["voter_type", "voter_id"], name: "index_votings_on_voter_type_and_voter_id", using: :btree

end
