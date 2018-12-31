Rails.application.routes.draw do


=begin
  get 'invoice_histories/index'
  get 'invoice_histories/create'
  get 'invoice_histories/new'
  get 'invoice_histories/destroy'
=end


  resources :invoice_histories do
    collection do
      get 'export'
    end
  end

  resources :requirements
  resources :invoice_statuses
  resources :invoices do
    collection do
      get 'display_pdf'
    end
  end
  get 'invoices/get_price/:id', to: 'invoices#get_price'
  get 'invoices/get_dam_canines/:id', to: 'invoices#get_dam_canines'
  get 'invoices/get_sire_canines/:id', to: 'invoices#get_sire_canines'
  get 'invoices/get_dams/:id', to: 'invoices#get_dams'
  get 'invoices/get_sires/:id', to: 'invoices#get_sires'
  get 'litters/get_dams/:id', to: 'litters#get_dams'
  get 'litters/get_sires/:id', to: 'litters#get_sires'
  resources :payment_methods
  resources :sales_people
  resources :sales_plans
  resources :canines
  resources :treatment_types
  resources :registration_companies
  resources :return_reasons
  resources :weight_categories
  resources :genders
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

  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  get '/logout' => 'sessions#destroy'

  resources :users

  #get '/signup' => 'users#new'
  #post '/users' => 'users#create'
  #root to: 'sessions#new'
  root to: 'menu#index'

  get 'menu/index'


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
