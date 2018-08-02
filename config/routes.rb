Rails.application.routes.draw do
  resources :plans
  resources :parent_events
  resources :travel_events, except: :index
  get '/manifesto', to: 'application#manifesto'
  get '/help', to: 'application#help'
  root to: 'application#home'
end
