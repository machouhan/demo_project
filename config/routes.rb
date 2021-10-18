Rails.application.routes.draw do
  
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :users
  devise_scope :user do  
     get '/users/sign_out' => 'devise/sessions#destroy'     
  end 
  
  root to: "products#index"
  get '/users' => 'users#show'
  resources :products
  get 'orders/buy'
  get 'orders/history'
  resources :orders

end

