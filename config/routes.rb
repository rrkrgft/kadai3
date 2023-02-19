Rails.application.routes.draw do
  get 'sessions/new'
  resources :users
  resources :photos
  resources :sessions, only: [:new, :create, :destroy ]
  resources :favorites, only: [:create, :destroy ]
end
