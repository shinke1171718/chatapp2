Rails.application.routes.draw do
  get '/user/:id', to: 'user#show'
  get '/rooms/:id', to: 'rooms#show', as: 'rooms_show'
  post '/rooms/:id', to: 'messages#create', as: 'message_create'
  post '/user/:id/rooms/', to: 'rooms#create', as: 'rooms_create'

  devise_scope :user do
    root to: 'users/registrations#new'
    get '/users/sign_out' => 'devise/sessions#destroy'
  end

  devise_for :users
  resources :users, only: [:show,:edit,:update] do
    resources :rooms, only: [:create, :show] do
      resources :messages, only: [:create]
    end
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
