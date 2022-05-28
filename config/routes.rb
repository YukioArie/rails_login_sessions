Rails.application.routes.draw do

  get 'login/index'
  post 'login/verify_login', to: 'login#verify_login'

  get 'register/index'
  post 'register/validate_account', to: 'register#validate_account'
  get 'home/index' 
  delete 'home/destroy_session', to: 'home#destroy_session'
  
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
   root 'home#index'
end
