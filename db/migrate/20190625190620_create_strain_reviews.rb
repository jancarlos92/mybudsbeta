class CreateStrainReviews < ActiveRecord::Migration[5.2]
  def change
    create_table :strain_reviews do |t|
        t.references :user, foreign_key: true
        t.string :userPersonality
        t.integer :mental
        t.integer :physical
        t.integer :velocity
        t.integer :flavor
        t.integer :overall
        t.string :content

        t.timestamps

    end
  end
end
