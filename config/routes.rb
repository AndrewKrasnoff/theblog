Rails.application.routes.draw do
  root 'posts#index'
  resources :posts
  resources :tags, only: [:show], constraints: { id: /[\w\W]+/ }
  resources :categories
end
