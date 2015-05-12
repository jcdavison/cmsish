Rails.application.routes.draw do
  resources :tiles
  resources :displays
  root to: 'home#index'
end
