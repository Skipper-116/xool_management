class CreatePersonAttributeTypes < ActiveRecord::Migration[5.2]
  def change
    create_table :person_attribute_types do |t|
      t.string :name
      t.string :description
      t.boolean :voided, default: false
      t.string :void_reason
      t.datetime :date_voided, null: true

      t.timestamps
    end
  end
end
