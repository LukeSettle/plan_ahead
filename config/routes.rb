Rails.application.routes.draw do
  resources :events
  resources :plans
  get '/manifesto', to: 'application#manifesto'
  get '/help', to: 'application#help'
  root to: 'application#home'
end
