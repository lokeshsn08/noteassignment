Rails.application.routes.draw do
  root 'users#index'
  post "/users/login", to: "users#login"
  get "/users/logout", to: "users#logout"
  get "/users/dashboard", to: "users#dashboard"
  get "/users/addusers", to: "users#addusers"
  resources :users, only: [:new, :create, :index, :show]
  resources :articles, only: [:new, :create, :index, :destroy, :show]
    # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
