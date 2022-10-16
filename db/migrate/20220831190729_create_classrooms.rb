class CreateClassrooms < ActiveRecord::Migration[5.2]
  def change
    create_table :classrooms do |t|
      t.string :name
      t.string :description
      t.integer :space
      t.boolean :voided, default: false
      t.string :void_reason
      t.datetime :date_voided, null: true

      t.timestamps
    end
  end
end
