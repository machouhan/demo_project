Rails.application.routes.draw do
  
  get 'cards/show'
  devise_for :users
  devise_scope :user do  
     get '/users/sign_out' => 'devise/sessions#destroy'     
  end 
  
  root to: "products#index"
  
  resources :products
  resources :order_items
  resource :cards, only:[:show]

end
