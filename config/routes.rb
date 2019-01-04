Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'products#index'
  # resources :products, only: [:show]
  # resources :orders, only: [:new, :create]
  resources :images, only: [:create, :destroy]
  resources :orders

  resources :products do
    resources :orders
    collection do
      get 'range'
    end
  end

  get '/products/tag/:name', to: 'products#tag', as: 'tag_products'


end
