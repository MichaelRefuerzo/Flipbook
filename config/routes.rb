Rails.application.routes.draw do
  resources :flipbooks
  resources :users

  devise_for :users,
    controllers: { sessions: 'users/sessions', registrations: 'users/registrations' },
    path: 'auth', 
    path_names: { 
      sign_in: 'login', 
      sign_out: 'logout', 
      password: 'secret', 
      confirmation: 'verification', 
      unlock: 'unblock', 
      registration: 'register', 
      sign_up: 'signup' 
    }
  
  get 'static_pages/landing_page'
  get 'static_pages/unauthorized' => 'static_pages#unauthorized'
  get 'users/:id/approve', to: "users#approve", as: 'approve'
  get 'users/:id/decline', to: "users#decline", as: 'decline'
  get 'users/:id/reject', to: "users#reject", as: 'reject'


  root 'static_pages#landing_page'

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  
end
