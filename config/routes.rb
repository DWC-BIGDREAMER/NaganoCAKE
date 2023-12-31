Rails.application.routes.draw do

  #devise:管理者用
  devise_for :admins, skip: [:registrations, :passwords], controllers: {
    sessions: "admin/sessions"
  }

  #devise:顧客用
  devise_for :customers, skip: [:passwords], controllers: {
    registrations: "public/registrations",
    sessions: "public/sessions"
  }



  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  #publicは表示させない
  scope module: :public do

  #homes
  root to: "homes#top"
  get "about" => "homes#about", as:"about"

  #searches
  get "search" => "searches#search"
  get "/genre/search" => "searches#genre_search"

  #items
  resources :items, only: [:index, :show]

  #cutomers
  get "customers/my_page" => "customers#show"
  get "customers/information/edit" => "customers#edit"
  patch "customers/my_page" => "customers#update", as: :update_customer
  get "customers/unsubscribe" => "customers#unsubscribe"
  patch "customers/withdraw" => "customers#withdraw"

  #cart_items
  resources :cart_items, only: [:index, :update, :create, :destroy] do
    collection do
      delete :destroy_all
    end
  end

  #orders
  resources :orders, only: [:new, :index, :create, :show] do
    collection do
      post :confirm
      get :thanks
    end
  end

  #addresses
  resources :addresses, only: [:index, :edit, :create, :update,:destroy]

  end

  namespace :admin do
    root to: 'homes#top'
    #searches
    get "search" => "searches#search"
    resources :customers,     only: [:index, :show, :edit, :update]
    resources :genres,        only: [:index, :create, :edit, :update, :destroy]
    resources :items,         only: [:index, :show, :create, :edit, :update, :new]
    resources :orders,        only: [:index, :show, :update]
    resources :order_details, only: [:update]

  end
end