class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  #before_action :set_customer_types_menu

  private

=begin
  def set_customer_types_menu
    @customer_types = CustomerType.all
  end
=end

  def current_user
    puts 'current user------->'
    puts @current_user
    puts session[:user_id]
    #if @current_user is false then use the the right side to assign to @current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
    #puts session[:user_id]
  end

  helper_method :current_user


  def authorize
    redirect_to '/login' unless current_user
  end



end
