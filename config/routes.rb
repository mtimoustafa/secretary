Rails.application.routes.draw do
  root 'contacts#index'

  resources :contacts, only: [:index, :show]

  namespace :api do
    namespace :v1 do
      post 'events', to: 'events#create'
      match 'events', to: 'events#update', via: [:patch, :put]
    end
  end
end
