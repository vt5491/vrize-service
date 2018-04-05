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

ActiveRecord::Schema.define(version: 20180331034617) do

  create_table "example_lift_reqs", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.bigint "example_id"
    t.integer "lift_failure_code", default: 0
    t.datetime "created_at", default: -> { "CURRENT_TIMESTAMP" }
    t.timestamp "updated_at", default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.index ["example_id"], name: "index_example_lift_reqs_on_example_id"
  end

  create_table "examples", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "name", default: ""
    t.string "category", default: ""
    t.string "keyword_1", default: ""
    t.string "keyword_2", default: ""
    t.boolean "liftable"
    t.integer "lift_score", default: 0
    t.boolean "lifted", default: false
    t.integer "lift_failure_code", default: 0
    t.datetime "lifted_at"
    t.datetime "created_at", default: -> { "CURRENT_TIMESTAMP" }
    t.timestamp "updated_at", default: -> { "CURRENT_TIMESTAMP" }, null: false
  end

  create_table "lift_fails", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.bigint "example_id"
    t.string "note", default: ""
    t.datetime "created_at", default: -> { "CURRENT_TIMESTAMP" }
    t.timestamp "updated_at", default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.index ["example_id"], name: "index_lift_fails_on_example_id"
  end

  create_table "lift_reqs", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.bigint "example_id"
    t.datetime "created_at", default: -> { "CURRENT_TIMESTAMP" }
    t.timestamp "updated_at", default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.index ["example_id"], name: "index_lift_reqs_on_example_id"
  end

  create_table "stats", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.bigint "example_id"
    t.integer "likes"
    t.float "avg_rating", limit: 24
    t.integer "impressions"
    t.integer "clicks"
    t.integer "code_views"
    t.datetime "created_at", default: -> { "CURRENT_TIMESTAMP" }
    t.timestamp "updated_at", default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.index ["example_id"], name: "index_stats_on_example_id"
  end

  add_foreign_key "example_lift_reqs", "examples"
  add_foreign_key "lift_fails", "examples"
  add_foreign_key "lift_reqs", "examples"
end
