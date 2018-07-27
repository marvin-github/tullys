class Invoice < ApplicationRecord
  belongs_to :customer
  belongs_to :canine
  belongs_to :veterinarian
  belongs_to :invoice_status

  validates :refund_amount, :numericality => {:less_than => 0}, :allow_blank => true, presence: {message: "must be negative"}
  after_validation :amounts

  after_save :create_invoice_history

  def create_invoice_history
    total_price = 0.0
    if self.invoice_status.name == 'Return' || self.invoice_status.name == 'Finalize'
      if self.invoice_status.name == 'Finalize'
        if !self.sale_discount.blank?
          total_price = self.sale_price - self.sale_discount
        else
          total_price = self.sale_price
        end
        Canine.where('id = ?', self.canine_id).update_all(sale_status_id: 2)
      end

      if self.invoice_status.name == 'Return'
        total_price = self.refund_amount
        Canine.where('id = ?', self.canine_id).update_all(sale_status_id: 1)
      end

      InvoiceHistory.create(invoice_id: self.id, purchase_date: self.purchase_date,  sale_discount: self.sale_discount,
                            sale_price: self.sale_price,  total_price: total_price, return_date: self.return_date,  refund_amount: self.refund_amount,
                            invoice_status: self.invoice_status.name)



    end

  end

  def amounts
    if self.invoice_status.name == 'Finalize'
      if !self.refund_amount.blank?
        errors.add(:refund_amount, "not valid with finalize status")
      end

      if self.sale_price.blank?
        errors.add(:sale_price, "must be > 0")
      end
    end

    if self.invoice_status.name == 'Return'
      if self.refund_amount.blank?
        errors.add(:refund_amount, "must be < 0")
      end

    end

  end
end
