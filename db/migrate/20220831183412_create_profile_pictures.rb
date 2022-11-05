class CreateProfilePictures < ActiveRecord::Migration[5.2]
  def change
    create_table :profile_pictures do |t|
      t.string :image_url
      t.references :person, foreign_key: true
      t.boolean :voided, default: false
      t.string :void_reason
      t.datetime :voided_at, null: true

      t.timestamps
    end
  end
end
