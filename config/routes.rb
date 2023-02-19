Rails.application.routes.draw do
  resources :users
  resources :photos
  resources :sessions, only: [:new, :create, :destroy ]
  resources :favorites, only: [:create, :destroy ]

  mount LetterOpenerWeb::Engine, at: "/letter_oppener" if Rails.env.development?
end
