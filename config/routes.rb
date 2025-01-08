Rails.application.routes.draw do
  # Trang đăng ký người dùng
  resources :users, only: [:new, :create]  # Đã bao gồm action new và create cho users

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
