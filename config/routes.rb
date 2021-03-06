Rails.application.routes.draw do

  root 'home#index'

  get "/sign_up" => "users#new"
  post "/sign_up" => "users#create"
  get "/sign_in" => "sessions#new"
  post "/sign_in" => "sessions#create"
  get "/users/sign_out" => "sessions#destroy"
  get ":id/share" => "card_users#new", as: "share"
  post ":id/share" => "card_users#create"

  resources :users 
  resources :cards

end
