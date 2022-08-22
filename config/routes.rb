Rails.application.routes.draw do
  devise_for :users
  root to: 'users#index'
  resources :users
  resources :comics do
    collection do
      get 'search'
    end

    resource :favorites, only: [:create, :destroy]
  end
end
