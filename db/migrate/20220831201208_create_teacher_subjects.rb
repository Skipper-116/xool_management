# frozen_string_literal: true

class CreateTeacherSubjects < ActiveRecord::Migration[5.2]
  def change
    create_table :teacher_subjects do |t|
      t.references :person, foreign_key: true
      t.references :subject, foreign_key: true
      t.boolean :voided, default: false
      t.string :void_reason
      t.datetime :voided_at, null: true

      t.timestamps
    end
  end
end
