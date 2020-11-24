Rails.application.routes.draw do
  get 'cars/index'
  get 'cars/show'
  get 'cars/index'
  get 'cars/new'
  get 'cars/create'
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
