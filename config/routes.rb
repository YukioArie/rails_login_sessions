Rails.application.routes.draw do

  get 'login/index'
  post 'login/verify_login', to: 'login#verify_login'

  get 'register/index'
  get 'home/index' 
  
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
   root 'home#index'
end
