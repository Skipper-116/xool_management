class CreatePeople < ActiveRecord::Migration[5.2]
  def change
    create_table :people do |t|
      t.date :birthdate
      t.references :gender, foreign_key: true
      t.boolean :bithdate_estimated

      t.timestamps
    end
  end
end
