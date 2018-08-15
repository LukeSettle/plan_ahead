Rails.application.routes.draw do
  resources :plans do
    get :new_event, on: :member
    post :continue_to_event_creation
  end
  resources :travel_events, except: :index
  resources :lodging_events, except: :index
  get '/manifesto', to: 'application#manifesto'
  get '/help', to: 'application#help'
  root to: 'application#home'
end
