class CreateProfilePictures < ActiveRecord::Migration[5.2]
  def change
    create_table :profile_pictures do |t|
      t.string :image_url
      t.references :person, foreign_key: true

      t.timestamps
    end
  end
end
