class Breeder < ApplicationRecord

  def full_name
    "#{last_name}" + ', ' + "#{first_name}"
  end

  def first_last_name
    "#{first_name}" + ' ' + "#{last_name}"
  end

end
