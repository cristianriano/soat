Rails.application.routes.draw do
  devise_for :users, path_names: {sign_in: "login", sign_out: "logout"}, controllers: {registrations: 'registrations', sessions: 'sessions'}
  root to: 'pages#home'

  filter :locale

  get 'home'          => 'pages#home', as: :home
  get 'contact'       => 'pages#contact', as: :contact
  get 'about'         => 'pages#about', as: :about

  resource :dashboard,      only: [:show]
  resources :insurances, except: [:destroy, :edit, :update]
  resources :vehicles, except: [:destroy, :edit, :update] do
    collection do
      match 'search', via: [:get, :post]
    end
  end
end
