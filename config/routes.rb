Rails.application.routes.draw do
  root 'contacts#index'

  resources :contacts, only: [:index, :show]

  namespace :api do
    namespace :v1 do
      post 'events', to: 'events#create'
    end
  end
end
