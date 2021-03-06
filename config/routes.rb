Rails.application.routes.draw do
  get     '/pages',       to: 'pages#index',    as: :list_page
  get     '/pages/new',   to: 'pages#new',      as: :new_page
  post    '/pages',       to: 'pages#save',     as: :pages
  get     '/pages/:gpid', to: 'pages#edit',     as: :edit_page
  delete  '/pages/:gpid', to: 'pages#destroy',  as: :destroy_page

  get     '/chunks/new',    to: 'chunks#new',     as: :new_chunk
  delete  '/chunks/:gcid',  to: 'chunks#destroy', as: :destroy_chunk
  put     '/chunks/:gcid',  to: 'chunks#sort',    as: :sort_chunk

  root 'pages#show'
end
