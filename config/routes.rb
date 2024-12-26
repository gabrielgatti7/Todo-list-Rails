Rails.application.routes.draw do
  resources :lists do
    resources :tasks, only: [:create, :update, :destroy]
  end
  root "lists#index"
end
