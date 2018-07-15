class Litter < ApplicationRecord
  belongs_to :breeder
  belongs_to :dam
  belongs_to :sire
  belongs_to :breed

end
