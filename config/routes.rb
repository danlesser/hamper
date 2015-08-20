Rails.application.routes.draw do
  root 'conventions#index'

  resources :user_sessions, only: [:new, :create, :destroy]
  resources :users, except: [:show]

  get 'login', to: 'user_sessions#new', as: :login
  post 'logout', to: 'user_sessions#destroy', as: :logout

  resources :conventions, shallow: true do
    resources :days, except: [:show, :index]
    resources :tracks, except: [:show, :index]
    resources :rooms, except: [:show, :index]
    resources :events
  end
end
