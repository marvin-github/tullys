class Customer < ApplicationRecord
  #validates :home_phone, uniqueness: true
  validates_uniqueness_of :mobile_phone, :allow_blank => true, :allow_nil => true
  validates_uniqueness_of :home_phone, :allow_blank => true, :allow_nil => true
  validates_format_of :mobile_phone, with: /\A\d{3}-\d{3}-\d{4}\z/, :allow_blank => true
  validates_format_of :home_phone, with: /\A\d{3}-\d{3}-\d{4}\z/, :allow_blank => true


  def full_name
    "#{last_name}" + ', ' + "#{first_name}"
  end

  def first_last_name
    "#{first_name}" + ' ' + "#{last_name}"
  end
end
