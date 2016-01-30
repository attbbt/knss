Rails.application.routes.draw do
  root "authentications#new"

  resources :authentications, only: [:new, :create]

  resources :users, only: [:index, :edit, :update, :create, :new, :destroy]
  resources :appointments, only: [:index, :new,:edit, :update, :create, :destroy]
  resources :pets, only: [:edit, :update, :new, :create]

  match 'signout', to: 'authentications#destroy', via: 'delete'

end
