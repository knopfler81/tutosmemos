Rails.application.routes.draw do

  namespace :users do
    resources :tutos
  end

  resources :tutos, only: [:show]

  resources :tutos do
    member do
      put "like", to: "tutos#upvote"
    end
  end

  get     "/register",  to: "devise/registrations#new", as: :register
  get     "/login",     to: "devise/sessions#new", as: :login
  get     "/logout",    to: "devise/sessions#destroy", as: :logout
  get     "/account",   to: "users#show", as: :account
  get     "/login" ,    to: "devise/sessions#new", as: :new_user_session
  post    "/login" ,    to: "devise/sessions#create", as: :user_session
  delete  "/logout" ,   to: "devise/sessions#destroy", as: :destroy_user_session

  devise_for :users, skip: [:sessions]

  resources :users
  resources :tutos

  root "home#landing"

end
