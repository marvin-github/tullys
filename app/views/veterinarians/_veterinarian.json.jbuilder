json.extract! veterinarian, :id, :first_name, :last_name, :company_name, :address1, :address2, :city, :state, :zip, :mobile_phone, :home_phone, :fax, :business_hours, :created_at, :updated_at
json.url veterinarian_url(veterinarian, format: :json)
