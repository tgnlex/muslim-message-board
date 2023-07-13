Rails.application.routes.draw do
  devise_for :users
  
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  resources :posts
  get "posts", to: "posts#index"
  get "dashboard", to: "dashboard#index" 
  get "info", to: "info#index"
  get "rules", to: "rules#index"
  get "admins", to: "admins#index" 
  root "home#index"
end
