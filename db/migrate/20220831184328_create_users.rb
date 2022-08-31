class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users, id: false do |t|
      t.references :person, foreign_key: true
      t.string :username
      t.string :password
      t.boolean :voided, default: false
      t.string :void_reason
      t.datetime :date_voided, null: true

      t.timestamps
    end
    execute 'ALTER TABLE users ADD PRIMARY KEY (person_id)'
  end
end
