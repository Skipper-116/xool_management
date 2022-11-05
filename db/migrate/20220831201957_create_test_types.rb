class CreateTestTypes < ActiveRecord::Migration[5.2]
  def change
    create_table :test_types do |t|
      t.string :name
      t.string :description
      t.float :scale
      t.boolean :voided, default: false
      t.string :void_reason
      t.datetime :voided_at, null: true

      t.timestamps
    end
  end
end
