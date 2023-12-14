Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  namespace :admin do
    root to: 'homes#top'
    resources :customers,     only: [:index, :show, :edit, :update]
    resources :genres,        only: [:index, :create, :edit, :update]
    resources :items,         only: [:index, :show, :create, :edit, :update, :new]
    resources :orders,        only: [:show, :update]
    resources :order_details, only: [:update]
    
  end


















  # このendをめぐってコンフリクト起きそう
end
