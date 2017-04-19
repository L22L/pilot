Rails.application.routes.draw do

  root  'static_pages#home'
  devise_for :users
  get "login" => "sessions#new"
  post "login" => "sessions#create"
  delete "logout" => "sessions#destroy"
  get "signup" => "users#new"
  namespace :admin do
    resources :users, only: [:edit, :destroy]
    resources :books, only: :create
    resources :lessons, only: :create
    resources :words, only: :create
  end
  resources :books, only: :show
  resources :lessons, only: :show
  resources :words, only: :show
end
