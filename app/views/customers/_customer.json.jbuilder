json.extract! customer, :id, :first_name, :last_name, :company_name, :address1, :address2, :city, :state, :zip, :mobile_phone, :home_phone, :email, :fax, :created_at, :updated_at
json.url customer_url(customer, format: :json)
