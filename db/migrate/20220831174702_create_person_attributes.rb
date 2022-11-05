class CreatePersonAttributes < ActiveRecord::Migration[5.2]
  def change
    create_table :person_attributes do |t|
      t.references :person, foreign_key: true
      t.references :person_attribute_type, foreign_key: true
      t.string :attribute_value, length: 500
      t.boolean :voided, default: false
      t.string :void_reason
      t.datetime :voided_at, null: true

      t.timestamps
    end
  end
end
