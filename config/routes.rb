Rails.application.routes.draw do
  get   '/pages/new',   to: 'pages#new',      as: :new_page

  post  '/chunks',      to: 'chunks#create',  as: :chunks
  put   '/chunks/:id',  to: 'chunks#update',  as: :chunk

  get   '/pages/:gpid', to: 'pages#edit',   as: :edit_page
  put   '/pages/:gpid', to: 'pages#update', as: :page

  get   '/pages/:gpid/chunks/new', to: 'chunks#new', as: :new_chunk

  post  '/chunk_editings',      to: 'chunk_editings#create',  as: :chunk_editings

  get 'sandbox', to: 'sandbox#index'

  root 'pages#new'
end
