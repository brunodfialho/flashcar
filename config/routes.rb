Rails.application.routes.draw do
  devise_for :users

  root to: 'pages#home'

  resources :cars, only:[:index, :show, :new, :create] do
    resources :bookings, only:[:index, :new, :create, :my_bookings]
  end
  resources :bookings, only:[:show, :edit, :update, :destroy,]
end
