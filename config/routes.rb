Rails.application.routes.draw do
  get 'sessions/new'
  get 'photos/new'
  get 'photos/index'
  get 'photos/show'
  get 'photos/edit'
  get 'users/new'
  get 'users/index'
  get 'users/show'
  get 'users/edit'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
