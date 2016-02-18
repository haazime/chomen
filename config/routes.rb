Rails.application.routes.draw do
  get   '/pages/new',         to: 'pages#new',    as: :new_page
  post  '/pages',             to: 'pages#create', as: :pages
  get   '/pages/:gpid/edit',  to: 'pages#edit',   as: :edit_page
  put   '/pages/:gpid',       to: 'pages#update', as: :page

  get 'sandbox', to: 'sandbox#index'
  root 'pages#new'
end
