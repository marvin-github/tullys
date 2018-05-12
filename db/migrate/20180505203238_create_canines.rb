class CreateCanines < ActiveRecord::Migration[5.1]
  def change
    create_table :canines do |t|
      t.references :litter, foreign_key: true
      t.string :micro_chip_number
      t.string :gender
      t.string :color
      t.string :arrival_weight
      t.references :weight_category, foreign_key: true
      t.string :sale_weight
      t.decimal :price, :precision => 8, :scale => 2

      t.decimal :sale_price, :precision => 8, :scale => 2

      t.string :fault_description
      t.decimal :fault_discount, :precision => 8, :scale => 2

      t.references :registration_company, foreign_key: true
      t.string :on_hold
      t.string :on_hold_reason
      t.date :available_date
      t.date :last_sold_date
      t.decimal :cost, :precision => 8, :scale => 2

      t.references :sale_status, foreign_key: true

      t.timestamps
    end
  end
end
