json.extract! registration_company, :id, :first_name, :last_name, :company_name, :address1, :address2, :city, :state, :zip, :mobile_phone, :home_phone, :fax, :created_at, :updated_at
json.url registration_company_url(registration_company, format: :json)
