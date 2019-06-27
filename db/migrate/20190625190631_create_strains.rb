class CreateStrains < ActiveRecord::Migration[5.2]
  def change
    create_table :strains do |t|
        t.references :user, foreign_key: true
        t.references :dispensary, index: true
        t.string :avatar
        t.string :strain_type
        t.string :strain_name
        t.string :location
        t.string :description
        t.integer :strain_reviews_count , default: 0
        t.integer :mental_indica_score, default: 0
        t.integer :physical_indica_score, default: 0
        t.integer :velocity_indica_score, default: 0
        t.integer :flavor_indica_score, default: 0
        t.integer :overall_indica_score, default: 0
        t.integer :mental_sativa_score, default: 0
        t.integer :physical_sativa_score, default: 0
        t.integer :velocity_sativa_score, default: 0
        t.integer :flavor_sativa_score, default: 0
        t.integer :overall_sativa_score, default: 0
        t.integer :mental_hybrid_score, default: 0
        t.integer :physical_hybrid_score, default: 0
        t.integer :velocity_hybrid_score, default: 0
        t.integer :flavor_hybrid_score, default: 0
        t.integer :overall_hybrid_score, default: 0



    end
  end
end
