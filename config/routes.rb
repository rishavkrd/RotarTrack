Rails.application.routes.draw do
  resources :types
  resources :event_types
  root 'home#show'
  resources :points
  resources :signups
  resources :events
  resources :authentications
  resources :accounts
  resources :accounts, shallow: true do
    resources :points
  end
  resources :statuses
  get '/dashboard' => 'dashboard#show'
  get '/dashboard/help' => 'dashboard#help'

  #get '/accounts/:UIN' => 'account#show'

  get '/auth/auth0/callback' => 'auth0#callback'
  get '/auth/failure' => 'auth0#failure'
  get '/auth/logout' => 'auth0#logout'
  get '/auth/redirect' => 'auth0#redirect'
  get '/profile/create' => 'profile#create'
  post '/profile/create' => 'profile#new'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
