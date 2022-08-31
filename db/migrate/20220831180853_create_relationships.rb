class CreateRelationships < ActiveRecord::Migration[5.2]
  def change
    create_table :relationships do |t|
      t.bigint :person_a, null: false
      t.references :relationship_type, foreign_key: true
      t.bigint :person_b, null: false

      t.timestamps
    end

    # first check if the foreign keys exist
    # if they do, then add the foreign key constraints
    # if they don't, then skip adding the foreign key constraints
    # this is to avoid errors when running the migration
    # on a database that already has data in it
    unless foreign_key_exists?(:relationships, column: :person_a)
      add_foreign_key :relationships, :people, column: :person_a, primary_key: :id
    end

    unless foreign_key_exists?(:relationships, column: :person_b)
      add_foreign_key :relationships, :people, column: :person_b, primary_key: :id
    end
  end
end
