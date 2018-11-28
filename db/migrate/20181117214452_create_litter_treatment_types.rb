class CreateLitterTreatmentTypes < ActiveRecord::Migration[5.1]
  def change
    create_table :litter_treatment_types do |t|
      t.references :litter, foreign_key: true
      t.references :treatment_type, foreign_key: true
      t.date :treatment_date

      t.timestamps
    end
  end
end
