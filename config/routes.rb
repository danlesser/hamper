Rails.application.routes.draw do
  root 'conventions#index'

  resources :conventions, shallow: true do
    resources :days, only: [:new, :create]
  end
end
