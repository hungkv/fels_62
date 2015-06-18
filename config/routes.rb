Rails.application.routes.draw do
  root "static_pages#home"
  get "help", to: "static_pages#help", as: :help_page
  get "about", to: "static_pages#about", as: :about_page
  devise_for :users
  resources :categories, only: :index
  resources :lessons, except: [:delete]
end
