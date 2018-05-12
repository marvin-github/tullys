class CreateTreatments < ActiveRecord::Migration[5.1]
  def change
    create_table :treatments do |t|
      t.references :canine, foreign_key: true
      t.references :treatment_type, foreign_key: true
      t.date :treatment_date

      t.timestamps
    end
  end
end
