Rails.application.routes.draw do
  resources :users, only: [:new, :create, :show, :destroy]
  resources :events, only: [:new, :create, :show, :index]
  resources :event_attendees, only: [:index, :new, :create, :update]
  get '/accept_invitation', to: 'event_attendees#accept_invitation', as: 'accept_invitation'
  root "users#new"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
