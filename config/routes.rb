Rails.application.routes.draw do
  root to: 'comics#index'
  resources :comics
end
