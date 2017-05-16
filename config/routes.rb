Rails.application.routes.draw do
  root to: 'pages#home'

  get 'home'          => 'pages#home', as: :home
  get 'contact'       => 'pages#contact', as: :contact
  get 'about'         => 'pages#about', as: :about
end
