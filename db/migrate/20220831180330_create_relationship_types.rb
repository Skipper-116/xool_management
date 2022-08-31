class CreateRelationshipTypes < ActiveRecord::Migration[5.2]
  def change
    create_table :relationship_types do |t|
      t.string :a_is_to_b
      t.string :b_is_to_a
      t.string :description

      t.timestamps
    end
  end
end
