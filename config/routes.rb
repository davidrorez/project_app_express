Rails.application.routes.draw do
  resources :orders
  resources :clients
  devise_for :users, path_names: {
    sign_in: 'login',
    sign_out: 'logout',
    password: 'secret',
    confirmation: 'verification',
    unlock: 'unblock',
    registration: 'register',
    sign_up: 'sign_up',
    password_new: 'recover_password'
  }, controllers: {
    registrations: 'users/registrations',
    sessions: 'users/sessions',
    passwords: 'users/passwords',
    confirmations: 'users/confirmations'
  }

  resources :tests
  resources :dishes
  resources :users

  root "dashboards#index"
end
