Rails.application.routes.draw do
  get 'missions/index'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  root to: 'pages#home'

  resources :listings do
    resources :bookings
    resources :reservations
  end

  resources :missions, only: %i[index]
end
