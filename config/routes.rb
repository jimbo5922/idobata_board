Rails.application.routes.draw do
  root 'static_page#home'
  get 'users/new'
  get '/signup', to:'users#new'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  get '/edit', to: 'users#edit'
  resources :users
  resources :boards do
    resources :responces, only: :create
  end
  resources :testsessions, only: :create
end