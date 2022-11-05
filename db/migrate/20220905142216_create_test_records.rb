class CreateTestRecords < ActiveRecord::Migration[5.2]
  def change
    create_table :test_records do |t|
      t.references :classroom, foreign_key: true
      t.references :cohort_term, foreign_key: true
      t.references :subject, foreign_key: true
      t.references :person, foreign_key: true
      t.string :title
      t.text :content
      t.string :other_resources
      t.datetime :start_date
      t.datetime :end_date
      t.datetime :results_available
      t.boolean :voided, default: false
      t.string :void_reason
      t.datetime :voided_at, null: true

      t.timestamps
    end
  end
end
