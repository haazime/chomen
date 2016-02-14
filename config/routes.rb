Rails.application.routes.draw do
  resources :note_creations, only: [:new, :create]

  root 'note_creations#new'
end
