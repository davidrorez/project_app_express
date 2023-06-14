Rails.application.routes.draw do

  resources :dishes
  resources :tests
  root "dashboards#index"
  
end
