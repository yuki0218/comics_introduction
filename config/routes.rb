Rails.application.routes.draw do
  devise_for :users
  root to: 'users#index'
  resources :users, only: [:index, :show] do
    collection do
      get 'good'
    end
  end
  resources :comics do
    collection do
      get 'search'
    end

    resource :favorites, only: [:create, :destroy]
  end
end
