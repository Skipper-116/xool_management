class CreateCohortTerms < ActiveRecord::Migration[5.2]
  def change
    create_table :cohort_terms do |t|
      t.string :name
      t.date :start_date
      t.date :end_date
      t.references :cohort, foreign_key: true
      t.boolean :voided, default: false
      t.string :void_reason
      t.datetime :voided_at, null: true

      t.timestamps
    end
  end
end
