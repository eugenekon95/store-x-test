Rails.application.routes.draw do
  ActiveAdmin::Devise.config
  # devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  root to: 'products#index'
  get 'autocomplete', to: 'products#complete', as: 'complete'

  resources :categories, only: :show do
    resources :products, only: %i[index show]
  end

  resources :products, only: %i[index show] do
    resources :comments, only: %i[create update destroy]
    resources :order_items, only: %i[create update destroy]
    get :search, on: :collection
  end

  resource :cart, only: %i[show update] do
    get :profile, on: :collection
  end
end
