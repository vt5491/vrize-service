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

ActiveRecord::Schema.define(version: 20180210033040) do

  create_table "examples", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "name", default: ""
    t.string "category", default: ""
    t.string "keyword_1", default: ""
    t.string "keyword_2", default: ""
    t.boolean "lifted", default: false
    t.integer "lift_failure_id", default: 0
    t.integer "likes", default: 0
    t.integer "avg_rating"
    t.datetime "lifted_at"
    t.datetime "created_at", default: -> { "CURRENT_TIMESTAMP" }
    t.timestamp "updated_at", default: -> { "CURRENT_TIMESTAMP" }, null: false
  end

end
