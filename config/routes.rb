Rails.application.routes.draw do
  resources :points
  resources :signups
  resources :events
  resources :authentications
  resources :accounts
  resources :statuses
  root 'accounts#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
