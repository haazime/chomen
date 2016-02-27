Rails.application.routes.draw do
  get   '/pages/new',   to: 'pages#new',      as: :new_page
  get   '/pages/:gpid', to: 'pages#edit',     as: :edit_page

  post  '/pages',       to: 'pages#save',     as: :pages

  get 'sandbox', to: 'sandbox#index'

  root 'pages#new'
end
