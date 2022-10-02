Rails.application.routes.draw do
  resources :event_types
  root 'home#show'
  resources :points
  resources :signups
  resources :events
  resources :authentications
  resources :accounts
  resources :statuses
  get '/dashboard' => 'dashboard#show'
  get '/auth/auth0/callback' => 'auth0#callback'
  get '/auth/failure' => 'auth0#failure'
  get '/auth/logout' => 'auth0#logout'
  get '/auth/redirect' => 'auth0#redirect'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
