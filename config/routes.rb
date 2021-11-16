Rails.application.routes.draw do

  resources :bookings, only: [:index, :new, :create, :edit, :update]
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :users, only: %i[index show] do
    resources :bookings, only: %i[index show update new create]
  end
  resources :services, only: %i[index show new create]

  patch 'bookings/:id/accepted', to: 'bookings#accept'
  patch 'bookings/:id/declined', to: 'bookings#decline'
end
