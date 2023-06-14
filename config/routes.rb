Rails.application.routes.draw do
  devise_for :users, path_names: { sign_in: 'login', sign_out: 'logout', 
                                  password: 'secret', confirmation: 'verification', unblock: 'unblock', 
                                  registration: 'register', sign_up: 'sign_up' }
  resources :tests
  root "dashboards#index"
  
end
