class Canine < ApplicationRecord
  belongs_to :litter
  belongs_to :weight_category
  belongs_to :registration_company
  belongs_to :sale_status
  has_many :treatments, :dependent => :destroy
  accepts_nested_attributes_for :treatments, allow_destroy: true
  #has_many :canine_treatment_types, dependent: :destroy
  #accepts_nested_attributes_for :canine_treatment_types, allow_destroy: true

  validates_presence_of :micro_chip_number
  validates_length_of :micro_chip_number, :minimum => 5, :too_short => "please enter at least 5 characters"
end
