Rails.application.routes.draw do
  get     '/pages/new',   to: 'pages#new',      as: :new_page
  post    '/pages',       to: 'pages#save',     as: :pages
  get     '/pages/:gpid', to: 'pages#edit',     as: :edit_page

  get     '/chunks/new',  to: 'chunks#new',     as: :new_chunk
  delete  '/chunk/:gcid', to: 'chunks#destroy', as: :destroy_chunk

  root 'pages#index'
end
