Rails.application.routes.draw do
  root 'contacts#index'

  resources :users, only: [:create]
  get 'login', to: 'sessions#index'
  post 'login', to: 'sessions#create'
  get 'logout', to: 'sessions#logout'
  get 'signup', to: 'sessions#new'

  resources :contacts, only: [:index, :show]

  namespace :api do
    namespace :v1 do
      post 'events', to: 'events#create'
    end
  end
end
