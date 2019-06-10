Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # resources :offers do
  #   resources :booking
  # end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/offers', to: 'offers#index', as: :offers
end
