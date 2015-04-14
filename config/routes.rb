Rails.application.routes.draw do
  root 'conventions#index'

  resources :conventions, except: [:show]
end
