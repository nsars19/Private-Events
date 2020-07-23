Rails.application.routes.draw do
  resources :users, only: [:new, :create, :show, :destroy]
  resources :events
  root "users#new"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
