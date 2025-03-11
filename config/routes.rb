Rails.application.routes.draw do
  root 'pages#index'

  devise_for :users
  resources :spaces do
    resources :bookings, only: [:create]
  end

  resources :bookings, only: [] do
    member do
      patch 'accept'
      patch 'decline'
    end
  end

  get 'dashboard', to: 'dashboard#index'
  get '/spaces', to: 'spaces#index', as: 'search_spaces'
end
