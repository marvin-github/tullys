class Litter < ApplicationRecord
  belongs_to :breeder
  belongs_to :dam
  belongs_to :sire


end
