Rails.application.routes.draw do
  get   '/pages/new',   to: 'pages#new',      as: :new_page
  get   '/pages/:gpid', to: 'pages#edit',     as: :edit_page

  post  '/chunks',      to: 'chunks#create',  as: :chunks
  patch   '/chunks/:id',  to: 'chunks#update',  as: :chunk

  get 'sandbox', to: 'sandbox#index'

  root 'pages#new'
end
