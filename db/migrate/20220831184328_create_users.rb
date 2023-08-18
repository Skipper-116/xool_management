# frozen_string_literal: true

class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users, id: false do |t|
      t.references :person, foreign_key: true
      t.string :username
      t.string :password_digest
      t.string :password_recovery_digest
      t.boolean :voided, default: false
      t.string :void_reason
      t.datetime :voided_at, null: true

      t.timestamps
    end
    execute 'ALTER TABLE users ADD PRIMARY KEY (person_id)'
  end
end
