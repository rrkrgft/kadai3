Rails.application.routes.draw do
  resources :users do
    get :favorites, on: :collection
  end
  resources :photos do
    resource :favorites, only: [:create, :destroy ]
  end
  resources :sessions, only: [:new, :create, :destroy ]
  resources :favorites, only: [:create, :destroy ]

  mount LetterOpenerWeb::Engine, at: "/letter_oppener" if Rails.env.development?
end
