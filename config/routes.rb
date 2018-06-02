Rails.application.routes.draw do
  resources :polls
  root 'polls#index'
end
