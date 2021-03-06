Rails.application.routes.draw do
  devise_for :users
  root 'posts#index'
  resources :posts
  resources :tags, only: [:show], constraints: { id: /[\w\W]+/ }
  resources :categories
end
