class CreateRegistrationCompanies < ActiveRecord::Migration[5.1]
  def change
    create_table :registration_companies do |t|
      t.string :first_name
      t.string :last_name
      t.string :company_name
      t.string :address1
      t.string :address2
      t.string :city
      t.string :state
      t.string :zip
      t.string :mobile_phone
      t.string :home_phone
      t.string :fax

      t.timestamps
    end
  end
end
