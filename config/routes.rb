Rails.application.routes.draw do
  get     '/pages/new',   to: 'pages#new',      as: :new_page
  post    '/pages',       to: 'pages#save',     as: :pages
  get     '/pages/:gpid', to: 'pages#edit',     as: :edit_page

  delete  '/chunks/:id',  to: 'chunks#destroy', as: :chunk
  get     '/chunks/new',  to: 'chunks#new', as: :new_chunk

  get 'sandbox', to: 'sandbox#index'

  root 'pages#index'
end
