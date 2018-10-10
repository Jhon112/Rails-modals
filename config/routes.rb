Rails.application.routes.draw do
  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      resources :products
    end
  end
  devise_for :users
  resources :products
  root 'products#index'
  get 'alert_js', to: 'products#alert_js', as: 'alert_js'
  
  # post '/invite_friend' to: 'users#invite_friend'
    get 'authenticate', to: 'users#authenticate'


end
