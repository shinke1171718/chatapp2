Rails.application.routes.draw do
  get 'messages/create'
  post 'users/show' => 'rooms/create'
  post 'rooms/create' => 'rooms/show'
  get 'rooms/create' => 'rooms(.:format)/show'
  devise_scope :user do
    root to: 'users/registrations#new'
    get '/users/sign_out' => 'devise/sessions#destroy'
  end
  devise_for :users
  resources :users, only: [:show,:edit,:update]
  resources :messages, only: [:create]
  resources :rooms, only: [:create,:show]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
