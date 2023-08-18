# frozen_string_literal: true

class CreateClassroomStudents < ActiveRecord::Migration[5.2]
  def change
    create_table :classroom_students do |t|
      t.references :classroom, foreign_key: true
      t.references :cohort_term, foreign_key: true
      t.references :person, foreign_key: true
      t.boolean :voided, default: false
      t.string :void_reason
      t.datetime :voided_at, null: true

      t.timestamps
    end
  end
end
