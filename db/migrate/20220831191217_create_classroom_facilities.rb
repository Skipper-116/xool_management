class CreateClassroomFacilities < ActiveRecord::Migration[5.2]
  def change
    create_table :classroom_facilities do |t|
      t.string :name
      t.string :description
      t.float :quantity
      t.references :classroom, foreign_key: true
      t.boolean :voided, default: false
      t.string :void_reason
      t.datetime :date_voided, null: true

      t.timestamps
    end
  end
end
