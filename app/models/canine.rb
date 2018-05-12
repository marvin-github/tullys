class Canine < ApplicationRecord
  belongs_to :litter
  belongs_to :weight_category
  belongs_to :registration_company
  belongs_to :sale_status
  has_many :treatments, :dependent => :destroy
  accepts_nested_attributes_for :treatments, allow_destroy: true
  #has_many :canine_treatment_types, dependent: :destroy
  #accepts_nested_attributes_for :canine_treatment_types, allow_destroy: true
end
