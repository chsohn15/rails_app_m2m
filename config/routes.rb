Rails.application.routes.draw do
  resources :stores
  resources :purchases
  resources :users
  resources :plants
  get "/about", to: "static#about"
  get "/", to: "static#home_page"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
