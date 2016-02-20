Rails.application.routes.draw do
  get   '/page_creations/new',  to: 'page_creations#new',     as: :new_page_creation
  post  '/page_creations',      to: 'page_creations#create',  as: :page_creations
  get   '/pages/:gpid', to: 'pages#edit',   as: :edit_page
  put   '/pages/:gpid', to: 'pages#update', as: :page

  get   '/pages/:gpid/chunks/new', to: 'chunks#new', as: :new_chunk

  post  '/chunk_editings',      to: 'chunk_editings#create',  as: :chunk_editings

  get 'sandbox', to: 'sandbox#index'

  root 'page_creations#new'
end
