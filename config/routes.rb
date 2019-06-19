Rails.application.routes.draw do
  resources :usrs
  devise_for :users
  root to: 'pages#home'

  resources :offers, only: [:index, :new, :create] do
    resources :bookings, only: [:new, :create]
  end

  get '/dashboard', to: 'dashboards#show'
  post '/sale_items/:id', to: 'dashboards#view'
end
