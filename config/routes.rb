Rails.application.routes.draw do
  root 'conventions#index'

  resources :conventions, shallow: true do
    resources :days, except: [:show, :index]
  end
end
