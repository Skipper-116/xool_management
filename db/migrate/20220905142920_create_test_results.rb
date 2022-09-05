class CreateTestResults < ActiveRecord::Migration[5.2]
  def change
    create_table :test_results do |t|
      t.references :test_records, foreign_key: true
      t.references :person, foreign_key: true
      t.float :grade
      t.boolean :voided, default: false
      t.string :void_reason
      t.datetime :date_voided, null: true

      t.timestamps
    end
  end
end
