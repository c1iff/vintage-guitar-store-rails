Rails.application.routes.draw do
  root to: 'landing#index'
  devise_for :users, :controllers => { registrations: 'registrations' }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :products do
    resources :comments, only: [:new, :create, :destroy]
    resources :carts, only: [:create, :index]
  end
end
