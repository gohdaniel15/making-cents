Rails.application.routes.draw do
  # Root page
  root to: "home#show"
  resource :home, only: [:show]

  # User sign up, sign in, and log in/log out
  resources :passwords, controller: "clearance/passwords", only: [:create, :new]
  resource :session, controller: "clearance/sessions", only: [:create]
  resources :users, controller: "users", only: [:create, :edit, :update] do
    resource :password,
      controller: "clearance/passwords",
      only: [:create, :edit, :update]
  end
  get "/sign_in" => "clearance/sessions#new", as: "sign_in"
  delete "/sign_out" => "clearance/sessions#destroy", as: "sign_out"
  get "/sign_up" => "clearance/users#new", as: "sign_up"
  get 'auth/:provider/callback', to: 'sessions#create'
  get 'auth/failure', to: redirect('/')
  get 'signout', to: 'sessions#destroy', as: 'signout'
  resources :sessions, only: [:create, :destroy]

  # routes for chat_rooms
  resources :chat_rooms, only: [:new, :create, :show, :index]
  mount ActionCable.server => '/cable'

  # routes for consultants
  resources :consultants
  
  resources :consultant_sessions
  
  #routes for categories
  resources :categories, only: [:show, :index]
end
