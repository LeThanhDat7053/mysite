Rails.application.routes.draw do
  # Route đăng ký người dùng
  get "registrations/new", to: "registrations#new", as: "registrations_new"
  post "registrations", to: "registrations#create", as: "registrations_create"
  # Các route khác
  resource :session
  resources :passwords, param: :token

  get "/products", to: "products#index"
  get "/products/new", to: "products#new"
  post "/products", to: "products#create"
  get "/products/:id", to: "products#show"
  get "/products/:id/edit", to: "products#edit"
  patch "/products/:id", to: "products#update"
  put "/products/:id", to: "products#update"
  delete "/products/:id", to: "products#destroy"

  root "products#index"

  resources :products do
    resources :subscribers, only: [ :create ]
  end

  resource :unsubscribe, only: [ :show ]
  resources :registrations, only: [:new, :create]
  resources :users
end
