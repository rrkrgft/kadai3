Rails.application.routes.draw do
  resouces :users
  resouces :photos
  resouces :sessions, only: [:new, :create, :destroy ]
  resouces :favorites, only: [:create, :destroy ]
end
