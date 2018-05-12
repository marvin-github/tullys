class CreateSaleStatuses < ActiveRecord::Migration[5.1]
  def change
    create_table :sale_statuses do |t|
      t.string :name
      t.string :description, limit: 100

      t.timestamps
    end
  end
end
