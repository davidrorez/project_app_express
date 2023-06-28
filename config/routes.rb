Rails.application.routes.draw do
  resources :oder_dishes
  resources :order_dishes

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

  namespace :api, defaults: { format: 'json' } do
    resources :users
    resources :clients
    resources :orders
    resources :dishes
    resources :order_dishes
  end
  
  resources :orders
  resources :clients
  resources :tests
  resources :dishes
  resources :users

  root "dashboards#index"
end
