Rails.application.routes.draw do

  root 'restaurants#home'
  resources :sessions, only: %i(new create destroy)
  resources :users
  resources :reviews, only: %i(new create show)
  resources :restaurants do
    resources :reservations
  end


end
