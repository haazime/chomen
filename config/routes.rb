Rails.application.routes.draw do
  resources :notes, only: [:new, :create]

  get 'sandbox', to: 'sandbox#index'

  root 'notes#new'
end
