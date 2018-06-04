Rails.application.routes.draw do
  resources :sessions, only: [:new, :create, :destroy]
  get  '/signup',  to: 'users#new'
  post '/signup',  to: 'users#create'
  resources :accounts do
    resources :comments, only: [:create, :destroy]
  end

  root 'welcome#index'
end
