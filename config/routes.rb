Rails.application.routes.draw do
  root    'static_pages#home'
  get     '/contact',  to: 'static_pages#contact'
  get     '/signup',   to: 'users#new'
  post    '/signup',   to: 'users#create'
  get     '/login',    to: 'sessions#new'
  post    '/login',    to: 'sessions#create'
  delete  '/logout',   to: 'sessions#destroy'
  resources :users, only: [:edit, :update, :destroy]
  resources :accounts do
    resources :comments, only: [:create, :destroy]
  end

end
