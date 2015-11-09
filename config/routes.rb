Rails.application.routes.draw do

  root 'home#index'

  get "/sign_up" => "users#new"
  post "/sign_up" => "users#create"
  get "/sign_in" => "sessions#new"
  post "/sign_in" => "sessions#create"
  get "/users/sign_out" => "sessions#destroy"
  get "/carduser" => "cardusers#new"
  post "/carduser" => "cardusers#create"

  resources :users 
  resources :cards
end
