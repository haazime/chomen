Rails.application.routes.draw do
  get     '/pages/new',   to: 'pages#new',      as: :new_page
  post    '/pages',       to: 'pages#save',     as: :pages
  get     '/pages/:gpid', to: 'pages#edit',     as: :edit_page

  get     '/chunks/new',    to: 'chunks#new',     as: :new_chunk
  delete  '/chunks/:gcid',  to: 'chunks#destroy', as: :destroy_chunk
  put     '/chunks/:gcid',  to: 'chunks#sort',    as: :sort_chunk

  root 'pages#index'
end
