Rails.application.routes.draw do
  devise_for :users
  root to: 'users#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  resources :users, only: %i[index show]

  get 'artists/:id', to: 'users#show', as: :artist

  # resources :services, only: %i[index show new create edit update destroy] do
  #   resources :bookings, only: %i[index show new create]
  resources :services, only: %i[show new create edit update destroy] do
    resources :bookings, only: %i[new create]
  end

  resources :bookings, only: %i[index edit update] do
    resources :reviews, only: %i[edit update new create delete]
  end
  patch 'bookings/:id/accepted', to: 'bookings#accept', as: :accept_booking
  patch 'bookings/:id/declined', to: 'bookings#decline', as: :decline_booking

  patch 'service/:id/edit/delete_photo', to: 'services#delete_photo', as: :delete_photo
end
