Rails.application.routes.draw do
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations',
    passwords: 'users/passwords'
  }

  root to: "dashboard#index"
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  resources :items, only: [:create, :destroy]
  resources :carts, only: [:show]
  resources :wishlists, only: [:show]
  resources :products

end
