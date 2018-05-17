class Customer < ApplicationRecord
  validates :home_phone, uniqueness: true
  validates_uniqueness_of :mobile_phone, :allow_blank => true, :allow_nil => true
  validates_format_of :mobile_phone, with: /\A\d{3}-\d{3}-\d{4}\z/
  validates_format_of :home_phone, with: /\A\d{3}-\d{3}-\d{4}\z/


  def full_name
    "#{last_name}" + ', ' + "#{first_name}"
  end
end
