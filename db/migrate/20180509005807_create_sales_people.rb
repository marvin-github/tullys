class CreateSalesPeople < ActiveRecord::Migration[5.1]
  def change
    create_table :sales_people do |t|
      t.string :first_name
      t.string :last_name
      t.references :sales_plan, foreign_key: true

      t.timestamps
    end
  end
end
