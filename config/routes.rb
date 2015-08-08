Rails.application.routes.draw do
  root "authentications#new"

  resources :authentications, only: [:new, :create]

  resources :users, only: [:index, :edit, :update]

end
