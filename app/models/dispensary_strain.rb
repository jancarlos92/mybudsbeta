class DispensaryStrain < ApplicationRecord

    belongs_to :dispensary, class_name: 'User', foreign_key: "user_id"
    belongs_to :strain

    




end
