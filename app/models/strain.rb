class Strain < ApplicationRecord

    has_many :dispensary_strains
    has_many :dispensaries, -> { where(dispensary: true) }, class_name: 'User' 

    has_many :strain_reviews
    has_many :users, through: :strain_reviews



    def strain_exist
        self.id?
    end

end
