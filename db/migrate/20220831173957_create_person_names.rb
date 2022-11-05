class CreatePersonNames < ActiveRecord::Migration[5.2]
  def change
    create_table :person_names do |t|
      t.string :given_name
      t.string :family_name
      t.string :maiden_name
      t.string :middle_name
      t.references :person, foreign_key: true
      t.boolean :voided, default: false
      t.string :void_reason
      t.datetime :voided_at, null: true

      t.timestamps
    end
  end
end
