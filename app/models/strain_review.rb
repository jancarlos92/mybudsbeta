class StrainReview < ApplicationRecord

    belongs_to :user
    belongs_to :strain

    #When strain reviews are posted, the strain review model should send the strains
    #to the strain model to have it all accumalated under the strain
    #strain should know its overall scores

    

end
