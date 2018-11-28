class LitterTreatment < ApplicationRecord
  belongs_to :litter
  belongs_to :treatment_type
end
