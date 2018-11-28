class Dam < ApplicationRecord
  belongs_to :breed
  belongs_to :breeder
  belongs_to :picture, optional: true
  #validates_presence_of :registration_number
end
