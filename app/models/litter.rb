class Litter < ApplicationRecord
  belongs_to :breeder
  belongs_to :dam
  belongs_to :sire
  belongs_to :breed
  has_many :litter_treatments, :dependent => :destroy, validate: false
  accepts_nested_attributes_for :litter_treatments, allow_destroy: true

end
