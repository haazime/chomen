Rails.application.routes.draw do
  resources :notes, only: [:new, :create, :edit, :update]

  get 'sandbox', to: 'sandbox#index'

  root 'notes#new'
end
