Rails.application.routes.draw do
  root to: 'posts#index'
  resources :posts, only: %i[index new create edit show update]
  resources :logins, only: %i[new create]
end
