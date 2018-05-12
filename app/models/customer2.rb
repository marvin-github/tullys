class Customer2 < ApplicationRecord
  belongs_to :customer_type
  #belongs_to :compensation_type

  #validates_presence_of :first_name
  #validates_presence_of :last_name, true, unless: ->(customer){customer.company_name.present?}
  #validates_presence_of :company_name, true, unless: ->(customer){customer.last_name.present?}
  #validates :company_name, presence:  { message:  'name must be enterd'}, unless: ->(customer){customer.last_name.present?}
  #validates :last_name, presence:  {message: "name must be enterd"}, unless: ->(customer){customer.company_name.present?}
  #validates_presence_of :address1
  #validates_presence_of :address2
  ##validates_presence_of :city
  #validates_presence_of :state
  #validates_presence_of :zip
  #validates_presence_of :mobile_phone
  #validates_presence_of :home_phone
  #validates_presence_of :fax




end
