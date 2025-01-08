Rails.application.routes.draw do
  # Trang đăng ký người dùng
  resources :users, only: [:new, :create]  # Đã bao gồm action new và create cho users

  # Các route khác
  resource :session
  resources :passwords, param: :token

  # Các route cho products
  resources :products do
    resources :subscribers, only: [:create]
  end

  root "products#index"

  resource :unsubscribe, only: [:show]
  resources :registrations, only: [:new, :create]
  resources :users
end
