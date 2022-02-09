Rails.application.routes.draw do
  resources :messages
  root 'application#index'
end