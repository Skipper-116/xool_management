class CreatePersonAttributeTypes < ActiveRecord::Migration[5.2]
  def change
    create_table :person_attribute_types do |t|
      t.string :name
      t.string :description

      t.timestamps
    end
  end
end
