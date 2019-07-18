class CreateDispensaryStrainJoinTable < ActiveRecord::Migration[5.2]
  def change
      create_table :dispensary_strains do |t|
          t.references :user, foreign_key: true
          t.references :strain, foreign_key: true
      end
  end
end
