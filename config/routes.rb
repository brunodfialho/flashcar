Rails.application.routes.draw do
  devise_for :users

  root to: 'pages#home'

  get "/cars/:id",    to: "cars#show", as: :car
  get "cars",         to: "cars#index"
  get "cars/new",     to: "cars#new", as: :new_car
  post "cars",        to: "cars#create"
  get "bookings/new", to: "bookings#new", as: :new_booking
  post "bookings",     to: "bookings#create"
  get "bookings/:id/edit", to: "bookings#edit", as: :edit_bookings
  patch "bookings/:id", to: "bookings#update"
  delete "bookings/:id", to: "bookings#destroy"
end
