# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 2022_10_29_091118) do
  create_table "classroom_facilities", charset: "utf8mb3", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.float "quantity"
    t.bigint "classroom_id"
    t.boolean "voided", default: false
    t.string "void_reason"
    t.datetime "voided_at", precision: nil
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.bigint "creator", default: 1, null: false
    t.bigint "changed_by"
    t.bigint "voided_by"
    t.index ["changed_by"], name: "fk_rails_f7a8753bf7"
    t.index ["classroom_id"], name: "index_classroom_facilities_on_classroom_id"
    t.index ["creator"], name: "fk_rails_32a6d29b1a"
    t.index ["voided_by"], name: "fk_rails_ca2f712d58"
  end

  create_table "classroom_students", charset: "utf8mb3", force: :cascade do |t|
    t.bigint "classroom_id"
    t.bigint "cohort_term_id"
    t.bigint "person_id"
    t.boolean "voided", default: false
    t.string "void_reason"
    t.datetime "voided_at", precision: nil
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.bigint "creator", default: 1, null: false
    t.bigint "changed_by"
    t.bigint "voided_by"
    t.index ["changed_by"], name: "fk_rails_4e07271993"
    t.index ["classroom_id"], name: "index_classroom_students_on_classroom_id"
    t.index ["cohort_term_id"], name: "index_classroom_students_on_cohort_term_id"
    t.index ["creator"], name: "fk_rails_9414311594"
    t.index ["person_id"], name: "index_classroom_students_on_person_id"
    t.index ["voided_by"], name: "fk_rails_b06c233c12"
  end

  create_table "classroom_teachers", charset: "utf8mb3", force: :cascade do |t|
    t.bigint "classroom_id"
    t.bigint "cohort_term_id"
    t.bigint "person_id"
    t.boolean "voided", default: false
    t.string "void_reason"
    t.datetime "voided_at", precision: nil
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.bigint "creator", default: 1, null: false
    t.bigint "changed_by"
    t.bigint "voided_by"
    t.index ["changed_by"], name: "fk_rails_5cf2cce31b"
    t.index ["classroom_id"], name: "index_classroom_teachers_on_classroom_id"
    t.index ["cohort_term_id"], name: "index_classroom_teachers_on_cohort_term_id"
    t.index ["creator"], name: "fk_rails_296873b2e6"
    t.index ["person_id"], name: "index_classroom_teachers_on_person_id"
    t.index ["voided_by"], name: "fk_rails_ac91c3c717"
  end

  create_table "classrooms", charset: "utf8mb3", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.integer "space"
    t.boolean "voided", default: false
    t.string "void_reason"
    t.datetime "voided_at", precision: nil
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.bigint "creator", default: 1, null: false
    t.bigint "changed_by"
    t.bigint "voided_by"
    t.index ["changed_by"], name: "fk_rails_13d3f793c2"
    t.index ["creator"], name: "fk_rails_d72048f98b"
    t.index ["voided_by"], name: "fk_rails_a94ea07eea"
  end

  create_table "cohort_terms", charset: "utf8mb3", force: :cascade do |t|
    t.string "name"
    t.date "start_date"
    t.date "end_date"
    t.bigint "cohort_id"
    t.boolean "voided", default: false
    t.string "void_reason"
    t.datetime "voided_at", precision: nil
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.bigint "creator", default: 1, null: false
    t.bigint "changed_by"
    t.bigint "voided_by"
    t.index ["changed_by"], name: "fk_rails_4f74b77e55"
    t.index ["cohort_id"], name: "index_cohort_terms_on_cohort_id"
    t.index ["creator"], name: "fk_rails_8d71de4b13"
    t.index ["voided_by"], name: "fk_rails_82185ed47c"
  end

  create_table "cohorts", charset: "utf8mb3", force: :cascade do |t|
    t.string "name"
    t.string "short_name"
    t.date "start_date"
    t.date "end_date"
    t.string "description"
    t.boolean "voided", default: false
    t.string "void_reason"
    t.datetime "voided_at", precision: nil
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.bigint "creator", default: 1, null: false
    t.bigint "changed_by"
    t.bigint "voided_by"
    t.index ["changed_by"], name: "fk_rails_a299007446"
    t.index ["creator"], name: "fk_rails_60e0e4d325"
    t.index ["voided_by"], name: "fk_rails_05c565ffc7"
  end

  create_table "genders", charset: "utf8mb3", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.boolean "voided", default: false
    t.string "void_reason"
    t.datetime "voided_at", precision: nil
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.bigint "creator", default: 1, null: false
    t.bigint "changed_by"
    t.bigint "voided_by"
    t.index ["changed_by"], name: "fk_rails_97cc7d0dd8"
    t.index ["creator"], name: "fk_rails_9f013ccd63"
    t.index ["voided_by"], name: "fk_rails_3837087ce6"
  end

  create_table "input_types", charset: "utf8mb3", force: :cascade do |t|
    t.string "name", null: false
    t.string "pattern"
    t.boolean "voided", default: false
    t.string "void_reason"
    t.datetime "voided_at", precision: nil
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.bigint "creator", default: 1, null: false
    t.bigint "changed_by"
    t.bigint "voided_by"
    t.index ["changed_by"], name: "fk_rails_92a8bd8dec"
    t.index ["creator"], name: "fk_rails_bea1ae06d4"
    t.index ["voided_by"], name: "fk_rails_2ca4605ff5"
  end

  create_table "people", charset: "utf8mb3", force: :cascade do |t|
    t.date "birthdate"
    t.bigint "gender_id"
    t.boolean "birthdate_estimated", default: false, null: false
    t.boolean "voided", default: false, null: false
    t.string "void_reason"
    t.datetime "voided_at", precision: nil
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.bigint "creator", default: 1, null: false
    t.bigint "changed_by"
    t.bigint "voided_by"
    t.index ["changed_by"], name: "fk_rails_caf50c268a"
    t.index ["creator"], name: "fk_rails_4a9413ff3e"
    t.index ["gender_id"], name: "index_people_on_gender_id"
    t.index ["voided_by"], name: "fk_rails_a6e182138c"
  end

  create_table "person_attribute_types", charset: "utf8mb3", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.boolean "is_required", default: false
    t.bigint "input_types_id"
    t.boolean "voided", default: false
    t.string "void_reason"
    t.datetime "voided_at", precision: nil
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.bigint "creator", default: 1, null: false
    t.bigint "changed_by"
    t.bigint "voided_by"
    t.index ["changed_by"], name: "fk_rails_99890db3e0"
    t.index ["creator"], name: "fk_rails_947fcc11d3"
    t.index ["input_types_id"], name: "index_person_attribute_types_on_input_types_id"
    t.index ["voided_by"], name: "fk_rails_812bf068ba"
  end

  create_table "person_attributes", charset: "utf8mb3", force: :cascade do |t|
    t.bigint "person_id"
    t.bigint "person_attribute_type_id"
    t.string "attribute_value"
    t.boolean "voided", default: false
    t.string "void_reason"
    t.datetime "voided_at", precision: nil
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.bigint "creator", default: 1, null: false
    t.bigint "changed_by"
    t.bigint "voided_by"
    t.index ["changed_by"], name: "fk_rails_940e9ef0cc"
    t.index ["creator"], name: "fk_rails_455a04e90b"
    t.index ["person_attribute_type_id"], name: "index_person_attributes_on_person_attribute_type_id"
    t.index ["person_id"], name: "index_person_attributes_on_person_id"
    t.index ["voided_by"], name: "fk_rails_75dfd7225b"
  end

  create_table "person_names", charset: "utf8mb3", force: :cascade do |t|
    t.string "given_name"
    t.string "family_name"
    t.string "maiden_name"
    t.string "middle_name"
    t.bigint "person_id"
    t.boolean "voided", default: false
    t.string "void_reason"
    t.datetime "voided_at", precision: nil
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.bigint "creator", default: 1, null: false
    t.bigint "changed_by"
    t.bigint "voided_by"
    t.index ["changed_by"], name: "fk_rails_c07b254eeb"
    t.index ["creator"], name: "fk_rails_95ce7c6db0"
    t.index ["person_id"], name: "index_person_names_on_person_id"
    t.index ["voided_by"], name: "fk_rails_632f6401a5"
  end

  create_table "profile_pictures", charset: "utf8mb3", force: :cascade do |t|
    t.string "image_url"
    t.bigint "person_id"
    t.boolean "voided", default: false
    t.string "void_reason"
    t.datetime "voided_at", precision: nil
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.bigint "creator", default: 1, null: false
    t.bigint "changed_by"
    t.bigint "voided_by"
    t.index ["changed_by"], name: "fk_rails_047c23b800"
    t.index ["creator"], name: "fk_rails_0a5b179016"
    t.index ["person_id"], name: "index_profile_pictures_on_person_id"
    t.index ["voided_by"], name: "fk_rails_51a72b03b3"
  end

  create_table "relationship_types", charset: "utf8mb3", force: :cascade do |t|
    t.string "a_is_to_b"
    t.string "b_is_to_a"
    t.string "description"
    t.boolean "voided", default: false
    t.string "void_reason"
    t.datetime "voided_at", precision: nil
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.bigint "creator", default: 1, null: false
    t.bigint "changed_by"
    t.bigint "voided_by"
    t.index ["changed_by"], name: "fk_rails_f85eb5ccd7"
    t.index ["creator"], name: "fk_rails_9d65e2709a"
    t.index ["voided_by"], name: "fk_rails_582d8ad8c0"
  end

  create_table "relationships", charset: "utf8mb3", force: :cascade do |t|
    t.bigint "person_a", null: false
    t.bigint "relationship_type_id"
    t.bigint "person_b", null: false
    t.boolean "voided", default: false
    t.string "void_reason"
    t.datetime "voided_at", precision: nil
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.bigint "creator", default: 1, null: false
    t.bigint "changed_by"
    t.bigint "voided_by"
    t.index ["changed_by"], name: "fk_rails_10ae531213"
    t.index ["creator"], name: "fk_rails_dd697a9f99"
    t.index ["person_a"], name: "fk_rails_a2033e96cc"
    t.index ["person_b"], name: "fk_rails_cdb1b80acf"
    t.index ["relationship_type_id"], name: "index_relationships_on_relationship_type_id"
    t.index ["voided_by"], name: "fk_rails_e36f863f3f"
  end

  create_table "roles", charset: "utf8mb3", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.boolean "voided", default: false
    t.string "void_reason"
    t.datetime "voided_at", precision: nil
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.bigint "creator", default: 1, null: false
    t.bigint "changed_by"
    t.bigint "voided_by"
    t.index ["changed_by"], name: "fk_rails_af21e11543"
    t.index ["creator"], name: "fk_rails_f0b260e680"
    t.index ["voided_by"], name: "fk_rails_f81e95d70c"
  end

  create_table "student_registries", charset: "utf8mb3", force: :cascade do |t|
    t.bigint "classroom_id"
    t.bigint "cohort_term_id"
    t.bigint "person_id"
    t.bigint "captured_by", null: false
    t.boolean "present", default: false
    t.string "absent_reason"
    t.boolean "voided", default: false
    t.string "void_reason"
    t.datetime "voided_at", precision: nil
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.datetime "obs_datetime"
    t.bigint "creator", default: 1, null: false
    t.bigint "changed_by"
    t.bigint "voided_by"
    t.index ["captured_by"], name: "fk_rails_0c2db770b6"
    t.index ["changed_by"], name: "fk_rails_b125c55363"
    t.index ["classroom_id"], name: "index_student_registries_on_classroom_id"
    t.index ["cohort_term_id"], name: "index_student_registries_on_cohort_term_id"
    t.index ["creator"], name: "fk_rails_3f48e75dbd"
    t.index ["person_id"], name: "index_student_registries_on_person_id"
    t.index ["voided_by"], name: "fk_rails_d08f32821b"
  end

  create_table "subjects", charset: "utf8mb3", force: :cascade do |t|
    t.string "name"
    t.string "desciption"
    t.boolean "voided", default: false
    t.string "void_reason"
    t.datetime "voided_at", precision: nil
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.bigint "creator", default: 1, null: false
    t.bigint "changed_by"
    t.bigint "voided_by"
    t.index ["changed_by"], name: "fk_rails_c38bd35b1a"
    t.index ["creator"], name: "fk_rails_ab4bbf000e"
    t.index ["voided_by"], name: "fk_rails_9275d21594"
  end

  create_table "teacher_registries", charset: "utf8mb3", force: :cascade do |t|
    t.bigint "cohort_id"
    t.bigint "person_id"
    t.bigint "captured_by"
    t.boolean "present"
    t.string "absent_reason"
    t.boolean "voided", default: false
    t.string "void_reason"
    t.datetime "voided_at", precision: nil
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.bigint "creator", default: 1, null: false
    t.bigint "changed_by"
    t.bigint "voided_by"
    t.index ["captured_by"], name: "fk_rails_efe3bb3902"
    t.index ["changed_by"], name: "fk_rails_0e4b0460bc"
    t.index ["cohort_id"], name: "index_teacher_registries_on_cohort_id"
    t.index ["creator"], name: "fk_rails_71fe18cae0"
    t.index ["person_id"], name: "index_teacher_registries_on_person_id"
    t.index ["voided_by"], name: "fk_rails_3f6a3b2000"
  end

  create_table "teacher_subjects", charset: "utf8mb3", force: :cascade do |t|
    t.bigint "person_id"
    t.bigint "subject_id"
    t.boolean "voided", default: false
    t.string "void_reason"
    t.datetime "voided_at", precision: nil
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.bigint "creator", default: 1, null: false
    t.bigint "changed_by"
    t.bigint "voided_by"
    t.index ["changed_by"], name: "fk_rails_9cb8888a95"
    t.index ["creator"], name: "fk_rails_ba9651134b"
    t.index ["person_id"], name: "index_teacher_subjects_on_person_id"
    t.index ["subject_id"], name: "index_teacher_subjects_on_subject_id"
    t.index ["voided_by"], name: "fk_rails_f0c50e4432"
  end

  create_table "test_records", charset: "utf8mb3", force: :cascade do |t|
    t.bigint "classroom_id"
    t.bigint "cohort_term_id"
    t.bigint "subject_id"
    t.bigint "person_id"
    t.string "title"
    t.text "content"
    t.string "other_resources"
    t.datetime "start_date", precision: nil
    t.datetime "end_date", precision: nil
    t.datetime "results_available", precision: nil
    t.boolean "voided", default: false
    t.string "void_reason"
    t.datetime "voided_at", precision: nil
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.bigint "creator", default: 1, null: false
    t.bigint "changed_by"
    t.bigint "voided_by"
    t.index ["changed_by"], name: "fk_rails_6014815faf"
    t.index ["classroom_id"], name: "index_test_records_on_classroom_id"
    t.index ["cohort_term_id"], name: "index_test_records_on_cohort_term_id"
    t.index ["creator"], name: "fk_rails_7fd60adc28"
    t.index ["person_id"], name: "index_test_records_on_person_id"
    t.index ["subject_id"], name: "index_test_records_on_subject_id"
    t.index ["voided_by"], name: "fk_rails_2723ca2233"
  end

  create_table "test_results", charset: "utf8mb3", force: :cascade do |t|
    t.bigint "test_records_id"
    t.bigint "person_id"
    t.float "grade"
    t.boolean "voided", default: false
    t.string "void_reason"
    t.datetime "voided_at", precision: nil
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.bigint "creator", default: 1, null: false
    t.bigint "changed_by"
    t.bigint "voided_by"
    t.index ["changed_by"], name: "fk_rails_1b9e6d5976"
    t.index ["creator"], name: "fk_rails_e31692d4ca"
    t.index ["person_id"], name: "index_test_results_on_person_id"
    t.index ["test_records_id"], name: "index_test_results_on_test_records_id"
    t.index ["voided_by"], name: "fk_rails_d60aefd51e"
  end

  create_table "test_types", charset: "utf8mb3", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.float "scale"
    t.boolean "voided", default: false
    t.string "void_reason"
    t.datetime "voided_at", precision: nil
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.bigint "creator", default: 1, null: false
    t.bigint "changed_by"
    t.bigint "voided_by"
    t.index ["changed_by"], name: "fk_rails_bea3754045"
    t.index ["creator"], name: "fk_rails_fc31efdaf6"
    t.index ["voided_by"], name: "fk_rails_7d6e4f90a5"
  end

  create_table "user_roles", charset: "utf8mb3", force: :cascade do |t|
    t.bigint "role_id"
    t.bigint "person_id"
    t.boolean "voided", default: false
    t.string "void_reason"
    t.datetime "voided_at", precision: nil
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.bigint "creator", default: 1, null: false
    t.bigint "changed_by"
    t.bigint "voided_by"
    t.index ["changed_by"], name: "fk_rails_d1ae6d5996"
    t.index ["creator"], name: "fk_rails_4b4887dc7b"
    t.index ["person_id"], name: "index_user_roles_on_person_id"
    t.index ["role_id"], name: "index_user_roles_on_role_id"
    t.index ["voided_by"], name: "fk_rails_890dce8496"
  end

  create_table "users", primary_key: "person_id", id: :bigint, default: nil, charset: "utf8mb3", force: :cascade do |t|
    t.string "username"
    t.string "password_digest"
    t.string "password_recovery_digest"
    t.boolean "voided", default: false
    t.string "void_reason"
    t.datetime "voided_at", precision: nil
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.bigint "creator", default: 1, null: false
    t.bigint "changed_by"
    t.bigint "voided_by"
    t.index ["changed_by"], name: "fk_rails_2b5948ae3b"
    t.index ["creator"], name: "fk_rails_fd256d8564"
    t.index ["person_id"], name: "index_users_on_person_id"
    t.index ["voided_by"], name: "fk_rails_10e8c3ab59"
  end

  add_foreign_key "classroom_facilities", "classrooms"
  add_foreign_key "classroom_facilities", "people", column: "changed_by"
  add_foreign_key "classroom_facilities", "people", column: "creator"
  add_foreign_key "classroom_facilities", "people", column: "voided_by"
  add_foreign_key "classroom_students", "classrooms"
  add_foreign_key "classroom_students", "cohort_terms"
  add_foreign_key "classroom_students", "people"
  add_foreign_key "classroom_students", "people", column: "changed_by"
  add_foreign_key "classroom_students", "people", column: "creator"
  add_foreign_key "classroom_students", "people", column: "voided_by"
  add_foreign_key "classroom_teachers", "classrooms"
  add_foreign_key "classroom_teachers", "cohort_terms"
  add_foreign_key "classroom_teachers", "people"
  add_foreign_key "classroom_teachers", "people", column: "changed_by"
  add_foreign_key "classroom_teachers", "people", column: "creator"
  add_foreign_key "classroom_teachers", "people", column: "voided_by"
  add_foreign_key "classrooms", "people", column: "changed_by"
  add_foreign_key "classrooms", "people", column: "creator"
  add_foreign_key "classrooms", "people", column: "voided_by"
  add_foreign_key "cohort_terms", "cohorts"
  add_foreign_key "cohort_terms", "people", column: "changed_by"
  add_foreign_key "cohort_terms", "people", column: "creator"
  add_foreign_key "cohort_terms", "people", column: "voided_by"
  add_foreign_key "cohorts", "people", column: "changed_by"
  add_foreign_key "cohorts", "people", column: "creator"
  add_foreign_key "cohorts", "people", column: "voided_by"
  add_foreign_key "genders", "people", column: "changed_by"
  add_foreign_key "genders", "people", column: "creator"
  add_foreign_key "genders", "people", column: "voided_by"
  add_foreign_key "input_types", "people", column: "changed_by"
  add_foreign_key "input_types", "people", column: "creator"
  add_foreign_key "input_types", "people", column: "voided_by"
  add_foreign_key "people", "genders"
  add_foreign_key "people", "people", column: "changed_by"
  add_foreign_key "people", "people", column: "creator"
  add_foreign_key "people", "people", column: "voided_by"
  add_foreign_key "person_attribute_types", "input_types", column: "input_types_id"
  add_foreign_key "person_attribute_types", "people", column: "changed_by"
  add_foreign_key "person_attribute_types", "people", column: "creator"
  add_foreign_key "person_attribute_types", "people", column: "voided_by"
  add_foreign_key "person_attributes", "people"
  add_foreign_key "person_attributes", "people", column: "changed_by"
  add_foreign_key "person_attributes", "people", column: "creator"
  add_foreign_key "person_attributes", "people", column: "voided_by"
  add_foreign_key "person_attributes", "person_attribute_types"
  add_foreign_key "person_names", "people"
  add_foreign_key "person_names", "people", column: "changed_by"
  add_foreign_key "person_names", "people", column: "creator"
  add_foreign_key "person_names", "people", column: "voided_by"
  add_foreign_key "profile_pictures", "people"
  add_foreign_key "profile_pictures", "people", column: "changed_by"
  add_foreign_key "profile_pictures", "people", column: "creator"
  add_foreign_key "profile_pictures", "people", column: "voided_by"
  add_foreign_key "relationship_types", "people", column: "changed_by"
  add_foreign_key "relationship_types", "people", column: "creator"
  add_foreign_key "relationship_types", "people", column: "voided_by"
  add_foreign_key "relationships", "people", column: "changed_by"
  add_foreign_key "relationships", "people", column: "creator"
  add_foreign_key "relationships", "people", column: "person_a"
  add_foreign_key "relationships", "people", column: "person_b"
  add_foreign_key "relationships", "people", column: "voided_by"
  add_foreign_key "relationships", "relationship_types"
  add_foreign_key "roles", "people", column: "changed_by"
  add_foreign_key "roles", "people", column: "creator"
  add_foreign_key "roles", "people", column: "voided_by"
  add_foreign_key "student_registries", "classrooms"
  add_foreign_key "student_registries", "cohort_terms"
  add_foreign_key "student_registries", "people"
  add_foreign_key "student_registries", "people", column: "captured_by"
  add_foreign_key "student_registries", "people", column: "changed_by"
  add_foreign_key "student_registries", "people", column: "creator"
  add_foreign_key "student_registries", "people", column: "voided_by"
  add_foreign_key "subjects", "people", column: "changed_by"
  add_foreign_key "subjects", "people", column: "creator"
  add_foreign_key "subjects", "people", column: "voided_by"
  add_foreign_key "teacher_registries", "cohorts"
  add_foreign_key "teacher_registries", "people"
  add_foreign_key "teacher_registries", "people", column: "captured_by"
  add_foreign_key "teacher_registries", "people", column: "changed_by"
  add_foreign_key "teacher_registries", "people", column: "creator"
  add_foreign_key "teacher_registries", "people", column: "voided_by"
  add_foreign_key "teacher_subjects", "people"
  add_foreign_key "teacher_subjects", "people", column: "changed_by"
  add_foreign_key "teacher_subjects", "people", column: "creator"
  add_foreign_key "teacher_subjects", "people", column: "voided_by"
  add_foreign_key "teacher_subjects", "subjects"
  add_foreign_key "test_records", "classrooms"
  add_foreign_key "test_records", "cohort_terms"
  add_foreign_key "test_records", "people"
  add_foreign_key "test_records", "people", column: "changed_by"
  add_foreign_key "test_records", "people", column: "creator"
  add_foreign_key "test_records", "people", column: "voided_by"
  add_foreign_key "test_records", "subjects"
  add_foreign_key "test_results", "people"
  add_foreign_key "test_results", "people", column: "changed_by"
  add_foreign_key "test_results", "people", column: "creator"
  add_foreign_key "test_results", "people", column: "voided_by"
  add_foreign_key "test_results", "test_records", column: "test_records_id"
  add_foreign_key "test_types", "people", column: "changed_by"
  add_foreign_key "test_types", "people", column: "creator"
  add_foreign_key "test_types", "people", column: "voided_by"
  add_foreign_key "user_roles", "people"
  add_foreign_key "user_roles", "people", column: "changed_by"
  add_foreign_key "user_roles", "people", column: "creator"
  add_foreign_key "user_roles", "people", column: "voided_by"
  add_foreign_key "user_roles", "roles"
  add_foreign_key "users", "people"
  add_foreign_key "users", "people", column: "changed_by"
  add_foreign_key "users", "people", column: "creator"
  add_foreign_key "users", "people", column: "voided_by"
end
