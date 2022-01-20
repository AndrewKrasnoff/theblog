Rails.application.routes.draw do
  root 'posts#index'
  resources :posts
  resources :tags, constraints: { id: /[0-z\.\+]+/ }
end
