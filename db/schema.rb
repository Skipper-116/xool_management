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

ActiveRecord::Schema.define(version: 2022_09_05_142920) do

  create_table "classroom_facilities", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.float "quantity"
    t.bigint "classroom_id"
    t.boolean "voided", default: false
    t.string "void_reason"
    t.datetime "date_voided"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["classroom_id"], name: "index_classroom_facilities_on_classroom_id"
  end

  create_table "classroom_students", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "classroom_id"
    t.bigint "cohort_term_id"
    t.bigint "person_id"
    t.boolean "voided", default: false
    t.string "void_reason"
    t.datetime "date_voided"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["classroom_id"], name: "index_classroom_students_on_classroom_id"
    t.index ["cohort_term_id"], name: "index_classroom_students_on_cohort_term_id"
    t.index ["person_id"], name: "index_classroom_students_on_person_id"
  end

  create_table "classroom_teachers", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "classroom_id"
    t.bigint "cohort_term_id"
    t.bigint "person_id"
    t.boolean "voided", default: false
    t.string "void_reason"
    t.datetime "date_voided"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["classroom_id"], name: "index_classroom_teachers_on_classroom_id"
    t.index ["cohort_term_id"], name: "index_classroom_teachers_on_cohort_term_id"
    t.index ["person_id"], name: "index_classroom_teachers_on_person_id"
  end

  create_table "classrooms", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.float "space"
    t.boolean "voided", default: false
    t.string "void_reason"
    t.datetime "date_voided"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "cohort_terms", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name"
    t.date "start_date"
    t.date "end_date"
    t.bigint "cohort_id"
    t.boolean "voided", default: false
    t.string "void_reason"
    t.datetime "date_voided"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["cohort_id"], name: "index_cohort_terms_on_cohort_id"
  end

  create_table "cohorts", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name"
    t.string "short_name"
    t.date "start_date"
    t.date "end_date"
    t.string "description"
    t.boolean "voided", default: false
    t.string "void_reason"
    t.datetime "date_voided"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "genders", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.boolean "voided", default: false
    t.string "void_reason"
    t.datetime "date_voided"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "input_types", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name", null: false
    t.string "pattern"
    t.boolean "voided", default: false
    t.string "void_reason"
    t.datetime "date_voided"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "people", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.date "birthdate"
    t.bigint "gender_id"
    t.boolean "bithdate_estimated"
    t.boolean "voided", default: false
    t.string "void_reason"
    t.datetime "date_voided"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["gender_id"], name: "index_people_on_gender_id"
  end

  create_table "person_attribute_types", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.boolean "is_required", default: false
    t.bigint "input_types_id"
    t.boolean "voided", default: false
    t.string "void_reason"
    t.datetime "date_voided"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["input_types_id"], name: "index_person_attribute_types_on_input_types_id"
  end

  create_table "person_attributes", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "person_id"
    t.bigint "person_attribute_type_id"
    t.string "attribute_value"
    t.boolean "voided", default: false
    t.string "void_reason"
    t.datetime "date_voided"
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
    t.boolean "voided", default: false
    t.string "void_reason"
    t.datetime "date_voided"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["person_id"], name: "index_person_names_on_person_id"
  end

  create_table "profile_pictures", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "image_url"
    t.bigint "person_id"
    t.boolean "voided", default: false
    t.string "void_reason"
    t.datetime "date_voided"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["person_id"], name: "index_profile_pictures_on_person_id"
  end

  create_table "relationship_types", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "a_is_to_b"
    t.string "b_is_to_a"
    t.string "description"
    t.boolean "voided", default: false
    t.string "void_reason"
    t.datetime "date_voided"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "relationships", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "person_a", null: false
    t.bigint "relationship_type_id"
    t.bigint "person_b", null: false
    t.boolean "voided", default: false
    t.string "void_reason"
    t.datetime "date_voided"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["person_a"], name: "fk_rails_a2033e96cc"
    t.index ["person_b"], name: "fk_rails_cdb1b80acf"
    t.index ["relationship_type_id"], name: "index_relationships_on_relationship_type_id"
  end

  create_table "roles", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.boolean "voided", default: false
    t.string "void_reason"
    t.datetime "date_voided"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "student_registries", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "classroom_id"
    t.bigint "cohort_term_id"
    t.bigint "person_id"
    t.bigint "captured_by", null: false
    t.boolean "present", default: false
    t.string "absent_reason"
    t.boolean "voided", default: false
    t.string "void_reason"
    t.datetime "date_voided"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["captured_by"], name: "fk_rails_0c2db770b6"
    t.index ["classroom_id"], name: "index_student_registries_on_classroom_id"
    t.index ["cohort_term_id"], name: "index_student_registries_on_cohort_term_id"
    t.index ["person_id"], name: "index_student_registries_on_person_id"
  end

  create_table "subjects", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name"
    t.string "desciption"
    t.boolean "voided", default: false
    t.string "void_reason"
    t.datetime "date_voided"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "teacher_registries", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "cohort_id"
    t.bigint "person_id"
    t.bigint "captured_by"
    t.boolean "present"
    t.string "absent_reason"
    t.boolean "voided", default: false
    t.string "void_reason"
    t.datetime "date_voided"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["captured_by"], name: "fk_rails_efe3bb3902"
    t.index ["cohort_id"], name: "index_teacher_registries_on_cohort_id"
    t.index ["person_id"], name: "index_teacher_registries_on_person_id"
  end

  create_table "teacher_subjects", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "person_id"
    t.bigint "subject_id"
    t.boolean "voided", default: false
    t.string "void_reason"
    t.datetime "date_voided"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["person_id"], name: "index_teacher_subjects_on_person_id"
    t.index ["subject_id"], name: "index_teacher_subjects_on_subject_id"
  end

  create_table "test_records", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "classroom_id"
    t.bigint "cohort_term_id"
    t.bigint "subject_id"
    t.bigint "person_id"
    t.string "title"
    t.text "content"
    t.string "other_resources"
    t.datetime "start_date"
    t.datetime "end_date"
    t.datetime "results_available"
    t.boolean "voided", default: false
    t.string "void_reason"
    t.datetime "date_voided"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["classroom_id"], name: "index_test_records_on_classroom_id"
    t.index ["cohort_term_id"], name: "index_test_records_on_cohort_term_id"
    t.index ["person_id"], name: "index_test_records_on_person_id"
    t.index ["subject_id"], name: "index_test_records_on_subject_id"
  end

  create_table "test_results", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "test_records_id"
    t.bigint "person_id"
    t.float "grade"
    t.boolean "voided", default: false
    t.string "void_reason"
    t.datetime "date_voided"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["person_id"], name: "index_test_results_on_person_id"
    t.index ["test_records_id"], name: "index_test_results_on_test_records_id"
  end

  create_table "test_types", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.float "scale"
    t.boolean "voided", default: false
    t.string "void_reason"
    t.datetime "date_voided"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "user_roles", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "role_id"
    t.bigint "person_id"
    t.boolean "voided", default: false
    t.string "void_reason"
    t.datetime "date_voided"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["person_id"], name: "index_user_roles_on_person_id"
    t.index ["role_id"], name: "index_user_roles_on_role_id"
  end

  create_table "users", primary_key: "person_id", id: :bigint, default: nil, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "username"
    t.string "password_digest"
    t.string "password_recovery_digest"
    t.boolean "voided", default: false
    t.string "void_reason"
    t.datetime "date_voided"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["person_id"], name: "index_users_on_person_id"
  end

  add_foreign_key "classroom_facilities", "classrooms"
  add_foreign_key "classroom_students", "classrooms"
  add_foreign_key "classroom_students", "cohort_terms"
  add_foreign_key "classroom_students", "people"
  add_foreign_key "classroom_teachers", "classrooms"
  add_foreign_key "classroom_teachers", "cohort_terms"
  add_foreign_key "classroom_teachers", "people"
  add_foreign_key "cohort_terms", "cohorts"
  add_foreign_key "people", "genders"
  add_foreign_key "person_attribute_types", "input_types", column: "input_types_id"
  add_foreign_key "person_attributes", "people"
  add_foreign_key "person_attributes", "person_attribute_types"
  add_foreign_key "person_names", "people"
  add_foreign_key "profile_pictures", "people"
  add_foreign_key "relationships", "people", column: "person_a"
  add_foreign_key "relationships", "people", column: "person_b"
  add_foreign_key "relationships", "relationship_types"
  add_foreign_key "student_registries", "classrooms"
  add_foreign_key "student_registries", "cohort_terms"
  add_foreign_key "student_registries", "people"
  add_foreign_key "student_registries", "people", column: "captured_by"
  add_foreign_key "teacher_registries", "cohorts"
  add_foreign_key "teacher_registries", "people"
  add_foreign_key "teacher_registries", "people", column: "captured_by"
  add_foreign_key "teacher_subjects", "people"
  add_foreign_key "teacher_subjects", "subjects"
  add_foreign_key "test_records", "classrooms"
  add_foreign_key "test_records", "cohort_terms"
  add_foreign_key "test_records", "people"
  add_foreign_key "test_records", "subjects"
  add_foreign_key "test_results", "people"
  add_foreign_key "test_results", "test_records", column: "test_records_id"
  add_foreign_key "user_roles", "people"
  add_foreign_key "user_roles", "roles"
  add_foreign_key "users", "people"
end
