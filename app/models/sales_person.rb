class SalesPerson < ApplicationRecord
  belongs_to :sales_plan

  def full_name
    "#{last_name}" + ', ' + "#{first_name}"
  end

  def first_last_name
    "#{first_name}" + ' ' + "#{last_name}"
  end

end
