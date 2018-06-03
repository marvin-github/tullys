class Litter < ApplicationRecord
  belongs_to :breed
  belongs_to :broker
  belongs_to :dam
  belongs_to :sire

end
