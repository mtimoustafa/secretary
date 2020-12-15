Rails.application.routes.draw do
  root 'contacts#index'
  resources 'contacts', only: [:index, :show]
end
