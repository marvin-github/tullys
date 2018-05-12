class CreateSalesPlans < ActiveRecord::Migration[5.1]
  def change
    create_table :sales_plans do |t|
      t.date :start_date
      t.date :end_date
      t.decimal :variable_percent, :precision => 8, :scale => 2
      t.decimal :flat_percent, :precision => 8, :scale => 2
      t.decimal :flat_amount, :precision => 8, :scale => 2
      t.decimal :max_amount, :precision => 8, :scale => 2
      t.timestamps
    end
  end
end
