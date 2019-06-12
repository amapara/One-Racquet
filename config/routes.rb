Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'

  resources :offers, only: [:index, :new, :create]
  get '/dashboard', to: 'dashboards#show'
  post '/sale_items/:id', to: 'dashboards#view'
end
