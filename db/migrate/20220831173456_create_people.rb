class CreatePeople < ActiveRecord::Migration[5.2]
  def change
    create_table :people do |t|
      t.date :birthdate
      t.references :gender, foreign_key: true
      t.boolean :bithdate_estimated
      t.boolean :voided, default: false
      t.string :void_reason
      t.datetime :date_voided, null: true

      t.timestamps
    end
  end
end
