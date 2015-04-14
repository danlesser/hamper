Rails.application.routes.draw do
  root 'conventions#index'

  resources :conventions
end
