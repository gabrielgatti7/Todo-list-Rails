Rails.application.routes.draw do
  devise_for :users
  resources :lists do
    resources :tasks, only: [ :new, :create, :edit, :update, :destroy ] do
      member do
        patch :toggle
      end
    end
  end

  root "lists#index"

  # Health check before catch-all
  get "up" => "rails/health#show", as: :rails_health_check

  match "*path", to: "application#routing_error", via: :all
end
