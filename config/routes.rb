Rails.application.routes.draw do
  root 'hamper#index'

  resources :conventions, only: [:index]
end
