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

ActiveRecord::Schema.define(version: 2022_08_31_180853) do

  create_table "genders", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "people", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.date "birthdate"
    t.bigint "gender_id"
    t.boolean "bithdate_estimated"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["gender_id"], name: "index_people_on_gender_id"
  end

  create_table "person_attribute_types", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "person_attributes", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "person_id"
    t.bigint "person_attribute_type_id"
    t.string "attribute_value"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["person_attribute_type_id"], name: "index_person_attributes_on_person_attribute_type_id"
    t.index ["person_id"], name: "index_person_attributes_on_person_id"
  end

  create_table "person_names", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "given_name"
    t.string "family_name"
    t.string "maiden_name"
    t.string "middle_name"
    t.bigint "person_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["person_id"], name: "index_person_names_on_person_id"
  end

  create_table "relationship_types", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "a_is_to_b"
    t.string "b_is_to_a"
    t.string "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "relationships", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "person_a", null: false
    t.bigint "relationship_type_id"
    t.bigint "person_b", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["person_a"], name: "fk_rails_a2033e96cc"
    t.index ["person_b"], name: "fk_rails_cdb1b80acf"
    t.index ["relationship_type_id"], name: "index_relationships_on_relationship_type_id"
  end

  add_foreign_key "people", "genders"
  add_foreign_key "person_attributes", "people"
  add_foreign_key "person_attributes", "person_attribute_types"
  add_foreign_key "person_names", "people"
  add_foreign_key "relationships", "people", column: "person_a"
  add_foreign_key "relationships", "people", column: "person_b"
  add_foreign_key "relationships", "relationship_types"
end
