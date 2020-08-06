Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: "home#index"

  get 'user/sign_up', to: 'home#sign_up'
  post 'user/save_user', to: 'home#save_user'

  get 'user/login', to: 'home#login'
  post 'authenticate', to: 'home#authenticate_user'

  get 'user/profile', to: 'home#user_profile'
  get 'user/destroy', to: 'home#destroy'
end
