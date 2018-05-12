class Treatment < ApplicationRecord
  belongs_to :canine
  belongs_to :treatment_type
end
