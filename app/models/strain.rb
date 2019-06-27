class Strain < ApplicationRecord

    belongs_to :dispensary, class_name: 'User', foreign_key: "user_id"
    belongs_to :user

    validates :dispensary, presence: true



end
