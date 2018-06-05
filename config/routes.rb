Rails.application.routes.draw do
  get 'static_pages/home'
  get 'static_pages/help'
  root 'welcome#index'
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
