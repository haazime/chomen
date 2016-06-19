Rails.application.routes.draw do
  get     '/pages/new',   to: 'pages#new',      as: :new_page
  post    '/pages',       to: 'pages#save',     as: :pages
  get     '/pages/:gpid', to: 'pages#edit',     as: :edit_page

  resources :chunks, only: [:new, :destroy]

  root 'pages#index'
end
