class CreateTeacherRegistries < ActiveRecord::Migration[5.2]
  def change
    create_table :teacher_registries do |t|
      t.references :cohort, foreign_key: true
      t.references :person, foreign_key: true
      t.bigint :captured_by
      t.boolean :present
      t.string :absent_reason
      t.boolean :voided, default: false
      t.string :void_reason
      t.datetime :date_voided, null: true

      t.timestamps
    end

    unless foreign_key_exists?(:teacher_registries, column: :captured_by)
      add_foreign_key :teacher_registries, :people, column: :captured_by, primary_key: :id
    end
  end
end
