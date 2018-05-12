class CreateRequirements < ActiveRecord::Migration[5.1]
  def change
    create_table :requirements do |t|
      t.date :start_date
      t.string :name
      t.text :description
      t.text :detail
      t.string :status

      t.timestamps
    end
  end
end
