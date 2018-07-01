class RegistrationCompany < ApplicationRecord
  validates_format_of :home_phone, with: /\A\d{3}-\d{3}-\d{4}\z/, :allow_blank => true, :message => "use 000-000-000 format"
  validates_format_of :mobile_phone, with: /\A\d{3}-\d{3}-\d{4}\z/, :allow_blank => true, :message => "use 000-000-000 format"
  validates_format_of :fax, with: /\A\d{3}-\d{3}-\d{4}\z/, :allow_blank => true, :message => "use 000-000-000 format"
end
