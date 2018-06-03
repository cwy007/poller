Rails.application.routes.draw do
  devise_for :users
  resources :polls
  root 'polls#index'
end
