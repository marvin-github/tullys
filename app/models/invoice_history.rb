class InvoiceHistory < ApplicationRecord
  validates :invoice_id, uniqueness: {scope: :invoice_status}
end