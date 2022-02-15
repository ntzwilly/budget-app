Rails.application.routes.draw do
  devise_for :users
  authenticated :user do
    root to: 'categories#index', as: :authenticated_root
  end
  resources :categories
  resources :actions

  root to: 'splash#index'
end
