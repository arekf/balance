Rails.application.routes.draw do
  root 'dashboard#index'

  get 'sessions/new', as: :new_session
  post 'sessions', to: 'sessions#create', as: :sessions
  delete 'sessions', to: 'sessions#destroy'

  resources :accounts
  resources :transactions
end
