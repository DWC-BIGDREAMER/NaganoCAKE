Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  #publicは表示させない
  scope module: :public do

  #homes
  root to: "homes#top"
  get "about" => "homes#about", as:"about"

  #cutomers
  get "customers/my_page" => "customers#show"
  get "customers/information/edit" => "customers#edit"
  patch "customers/information" => "customers#update"
  get "customers/unsubscribe" => "customers#unsubscribe"
  patch "customers/withdraw" => "customers#withdraw"
  end

end
