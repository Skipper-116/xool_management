# frozen_string_literal: true

class CreateInputTypes < ActiveRecord::Migration[5.2]
  def change
    create_table :input_types do |t|
      t.string :name, null: false, unique: true
      t.string :pattern, null: true
      t.boolean :voided, default: false
      t.string :void_reason, null: true
      t.datetime :voided_at, null: true

      t.timestamps
    end
  end
end
