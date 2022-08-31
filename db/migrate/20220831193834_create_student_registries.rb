class CreateStudentRegistries < ActiveRecord::Migration[5.2]
  def change
    create_table :student_registries do |t|
      t.references :classroom, foreign_key: true
      t.references :cohort_term, foreign_key: true
      # student id
      t.references :person, foreign_key: true
      t.bigint :captured_by, null: false
      t.boolean :present, default: false
      t.string :absent_reason, null: true

      t.timestamps
    end

    unless foreign_key_exists?(:student_registries, column: :captured_by)
      add_foreign_key :student_registries, :people, column: :captured_by, primary_key: :id
    end
  end
end
