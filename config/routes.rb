Rails.application.routes.draw do
  resources :users, only: [:new, :create]
  resources :sessions, only: [:new, :create, :destroy]
  get  '/signup',  to: 'users#new'
  resources :accounts do
    resources :comments, only: [:create, :destroy]
  end

  root 'welcome#index'
end
