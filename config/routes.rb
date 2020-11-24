Rails.application.routes.draw do
  get 'cars/index'
  get 'cars/show'
  get 'cars/index'
  get 'cars/new'
  get 'cars/create'
  root to: 'pages#home'

  get "/cars/:id",    to: "cars#show", as: :car
  get "cars",         to: "cars#index"
  get "cars/new",     to: "cars#new", as: :new_car
  post "cars",        to: "cars#create"

  get "bookings/new", to: "bookings#new", as: :new_booking
  post "bookings"     to: "booking#create"

  get "bookings/:id/edit" to: "bookings#edit" as: :edit_bookings
  patch "bookings/:id" to: "bookings#update"

  delete "bookings/:id" to: "booking#destroy"


  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
