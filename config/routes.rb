# A route in Rails refers to a line of code that pairs an HTTP Method and a URL path.
# The route also tells Rails which controller and action should respond to a request.

# To create all of the CRUD routes for the application, we can use the resources method.

Rails.application.routes.draw do
  devise_for :users
  resources :lists do
    resources :tasks, only: [ :new, :create, :edit, :update, :destroy ] do
      member do
        patch :toggle
      end
    end
  end
  root "lists#index" # We can tell Rails the root route should render the Lists index action

  # Route to catch any other path
  match "*path", to: "application#routing_error", via: :all
end
