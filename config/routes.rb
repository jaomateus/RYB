Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  get "uikit", to: "pages#ui_kit"
  get "proj_dashboard", to: "pages#proj_dashboard"

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  resources :sites do
    resources :plants, only: [:new, :create]
    resources :logs, only: [:new, :create]
  end

  resources :plants, only: [:show, :index]
  # Defines the root path route ("/")

  # root "articles#index"
end
