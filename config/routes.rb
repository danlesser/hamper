Rails.application.routes.draw do
  root 'conventions#index'

  resources :conventions, only: [:index, :new, :create]
end
