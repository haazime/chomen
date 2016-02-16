Rails.application.routes.draw do
  resources :note_savings, only: [:new, :create]

  get 'sandbox', to: 'sandbox#index'

  root 'note_savings#new'
end
