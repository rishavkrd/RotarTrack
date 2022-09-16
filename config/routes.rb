Rails.application.routes.draw do
  resources :signups
  resources :events
  resources :authentications
  resources :accounts
  resources :statuses
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
