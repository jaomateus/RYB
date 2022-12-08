Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  resources :plants, only: [:new, :create, :show, :index]

  resources :sites do
    resources :site_plants
    resources :logs, only: [:new, :create, :show, :index]
    get "nursury", to: "pages#nursury"
    get "dashboard", to: "pages#dashboard"
    get "search", to: "pages#search"
  end

  get "my_sites_map", to: "pages#my_sites_map"
  get "uikit", to: "pages#ui_kit"
  get "proj_dashboard", to: "pages#proj_dashboard"

  # Defines the root path route ("/")

  # root "articles#index"
end
