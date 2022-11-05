class CreatePeople < ActiveRecord::Migration[5.2]
  def change
    create_table :people do |t|
      t.date :birthdate
      t.references :gender, foreign_key: true
      t.boolean :birthdate_estimated, default: false, null: false
      t.boolean :voided, default: false, null: false
      t.string :void_reason
      t.datetime :voided_at, null: true

      t.timestamps
    end
  end
end
