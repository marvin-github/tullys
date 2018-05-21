Rails.application.routes.draw do
  resources :requirements
  resources :invoice_statuses
  resources :invoices do
    collection do
      get 'display_pdf'
    end
  end
  resources :payment_methods
  resources :sales_people
  resources :sales_plans
  resources :canines
  resources :treatment_types
  resources :registration_companies
  resources :return_reasons
  resources :weight_categories
  resources :litters
  resources :sires
  resources :dams
  resources :pictures
  resources :breeds
  resources :customers do
    collection do
      get 'phone_search'
    end
  end
  resources :breeders
  resources :brokers
  resources :veterinarians
  resources :peds
  root to: 'menu#index'

  get 'menu/index'


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
