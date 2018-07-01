class Invoice < ApplicationRecord
  belongs_to :customer
  belongs_to :canine
  belongs_to :veterinarian
  belongs_to :invoice_status
  #belongs_to :payment_method
end
