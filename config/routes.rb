Rails.application.routes.draw do
  get 'users/new'
  root 'static_page#home'
  get '/signup', to:'users#new'
  resources :users
end