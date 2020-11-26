Rails.application.routes.draw do
  devise_for :users

  root to: 'pages#home'

  resources :cars, only:[:index, :show, :new, :create]
  resources :bookings, only:[:new, :create, :edit, :updtate, :destroy]

end
