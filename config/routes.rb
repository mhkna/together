Rails.application.routes.draw do
  root    'accounts#new'
  get     '/login',    to: 'sessions#new'
  post    '/login',    to: 'sessions#create'
  delete  '/logout',   to: 'sessions#destroy'
  get     '/signup',   to: 'users#new'
  post    '/signup',   to: 'users#create'
  get     '/wait',     to: 'static_pages#wait_room'
  get     '/home',     to: 'static_pages#home'
  get     '/contact',  to: 'static_pages#contact'
  resources :users, only: [:edit, :update, :destroy]
  resources :accounts do
    resources :comments, except: [:show]
  end
  resources :rounds, only: [:show]

end
