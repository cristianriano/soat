Rails.application.routes.draw do
  devise_for :users, path_names: {sign_in: "login", sign_out: "logout"}, controllers: {registrations: 'registrations'}
  root to: 'pages#home'

  get 'home'          => 'pages#home', as: :home
  get 'contact'       => 'pages#contact', as: :contact
  get 'about'         => 'pages#about', as: :about

  resource :dashboard,      only: [:show]
end
