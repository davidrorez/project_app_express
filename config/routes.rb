Rails.application.routes.draw do
  resources :tests
  root "dashboards#index"
end
