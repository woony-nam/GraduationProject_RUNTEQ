Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: "registrations",
    sessions: "sessions"
  }

  root "static_pages#index"

  get "age_verification", to: "age_verification#new"
  post "age_verification", to: "age_verification#create"
  get "search", to: "search#index"
  get "menu", to: "menus#index"
  get "main", to: "main_pages#index"

  resources :age_verification, only: [ :create ] # age_verificationsのルートを定義
  resources :posts, only: [:index, :new, :create, :destroy, :show, :edit, :update]
  resources :users, only: [:destroy, :edit, :update, :show]


  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Render dynamic PWA files from app/views/pwa/*
  get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker
  get "manifest" => "rails/pwa#manifest", as: :pwa_manifest

  # Defines the root path route ("/")
end
