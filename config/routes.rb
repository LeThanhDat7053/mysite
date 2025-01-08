Rails.application.routes.draw do
  # Route đăng ký người dùng
  get 'sign_up', to: 'users#new', as: 'new_user_registration' # Đường dẫn cho trang đăng ký
  post 'users', to: 'users#create', as: 'users'               # Route tạo người dùng

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
  resources :users, only: [:new, :create]
end
