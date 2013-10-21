GoogleApi::Application.routes.draw do
  resources :reservations
  resources :rooms
  resources :sessions
  
  root "pages#home"
  match '/auth/:provider/callback', to: 'sessions#create', via: [:get, :post]

end
