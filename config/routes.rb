Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  get "uikit", to: "pages#ui_kit"
  get "proj_dashboard", to: "pages#proj_dashboard"



  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  resources :sites do
    resources :plants, only: [:new, :create, :show, :index]
    resources :logs, only: [:new, :create, :show, :index]
    get "nursury", to: "pages#nursury"
    get "dashboard", to: "pages#dashboard"
    get "search", to: "pages#search"
  end

  # Defines the root path route ("/")

  # root "articles#index"
end
