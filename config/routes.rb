Rails.application.routes.draw do
  devise_for :users
  resources :polls
  resources :votes, only: [:create]
  root 'polls#index'
end
