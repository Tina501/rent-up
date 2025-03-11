Rails.application.routes.draw do
  root 'pages#index'

  devise_for :users
  resources :spaces do
    resources :bookings, only: [:create]
  end

  resources :bookings do
    member do
      patch :accept
      patch :decline
    end
  end

  resource :dashboard, only: [:show]

  get '/spaces', to: 'spaces#index', as: 'search_spaces'
end
