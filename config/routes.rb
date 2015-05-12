Rails.application.routes.draw do
  resources :tiles
  resources :displays
  put '/display_indices/:id', to: 'displays#indices', as: 'update_indices'
  root to: 'home#index'
end
