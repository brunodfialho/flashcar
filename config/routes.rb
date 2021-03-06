Rails.application.routes.draw do
  devise_for :users

  root to: 'pages#home'

  resources :cars, only:[:index, :show, :new, :create] do
    resources :bookings, only:[:index, :new, :create,]
  end
  resources :bookings, only:[:show, :edit, :update, :destroy,]

  get "my_bookings",       to: "bookings#my_bookings"
end


