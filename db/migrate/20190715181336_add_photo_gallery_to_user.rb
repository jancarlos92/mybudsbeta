class AddPhotoGalleryToUser < ActiveRecord::Migration[5.2]
  def change
      create_table :galleries do |t|
          t.references :user, foreign_key: true
          t.references :photo, index: true

      end
  end
end
