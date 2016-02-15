Rails.application.routes.draw do
  resources :note_savings, only: [:new, :create]

  root 'note_savings#new'
end
