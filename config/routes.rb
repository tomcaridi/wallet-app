Rails.application.routes.draw do

  root 'home#homepage'

  get "/sign_up" => "users#new"
  post "/sign_up" => "users#create"
  get "/sign_in" => "sessions#new"
  post "/sign_in" => "sessions#create"
  get "/users/sign_out" => "sessions#destroy"
  get "/share/new" => "cardusers#share"
  post "/share/new" => "cardusers#share"

  resources :users 
  resources :cards
end
