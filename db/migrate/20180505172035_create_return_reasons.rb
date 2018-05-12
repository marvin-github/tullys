class CreateReturnReasons < ActiveRecord::Migration[5.1]
  def change
    create_table :return_reasons do |t|
      t.string :name
      t.string :description

      t.timestamps
    end
  end
end
