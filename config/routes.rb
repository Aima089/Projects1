Rails.application.routes.draw do
  # Define Devise routes before any custom routes related to Devise
  devise_for :users, controllers: { registrations: 'registrations' }

  # Define custom routes
  devise_scope :user do
    get 'signin', to: 'devise/sessions#new' 
    delete 'users/sign_out', to: 'devise/sessions#destroy'
    root to: 'dashboard#index'

    get 'users', to: 'users#index', as: 'users_list'
  end
  
  # Define other routes
  resources :products
end
