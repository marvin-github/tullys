class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :set_customer_types_menu

  private

  def set_customer_types_menu
    @customer_types = CustomerType.all
  end

end
