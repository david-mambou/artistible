Rails.application.routes.draw do
  devise_for :users
  root to: 'services#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :users, only: %i[index show]
  resources :bookings, only: %i[index new create edit update] do
    resources :reviews, only: %i[edit update new create delete]
  end
  resources :services, only: %i[index show new create]

  patch 'bookings/:id/accepted', to: 'bookings#accept', as: :accept_booking
  patch 'bookings/:id/declined', to: 'bookings#decline', as: :decline_booking
end
