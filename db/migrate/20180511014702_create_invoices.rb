class CreateInvoices < ActiveRecord::Migration[5.1]
  def change
    create_table :invoices do |t|
      t.references :customer, foreign_key: true
      t.references :canine, foreign_key: true
      t.date :purchase_date
      t.decimal :sale_price
      t.decimal :sale_discount
      t.string :sale_discount_reason
      t.string :paper_deliver_method
      t.string :credit_card_last_4
      t.integer :payment_method_1
      t.integer :payment_method_2
      t.decimal :payment_amount_1
      t.decimal :payment_amount_2
      t.date :payment_date
      t.references :veterinarian, foreign_key: true
      t.integer :sales_person_1
      t.integer :sales_person_2
      t.decimal :commission_percent
      t.date :return_date
      t.decimal :refund_amount
      t.string :refund_method
      t.string :sale_completed
      t.integer :invoice_status

      t.timestamps
    end
  end
end
