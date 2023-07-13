Rails.application.routes.draw do
  devise_for :users
  
  # http://localhost:3000/rails/info/routes show all routes
  resources :posts do 
    resources :comments
  end 
  
  get "posts", to: "posts#index"
  get "dashboard", to: "dashboard#index" 
  get "info", to: "info#index"
  get "rules", to: "rules#index"
  get "admins", to: "admins#index" 
  root "home#index"
end
