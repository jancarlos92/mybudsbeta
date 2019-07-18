class AddingPhotosMigration < ActiveRecord::Migration[5.2]
  def change
      create_table :photos do |t|
          t.references :gallery, foreign_key: true
          t.references :user, foreign_key: true
          t.string :image
          t.string :description
      end
  end
end
