Rails.application.routes.draw do
  devise_for :users
  root 'frees#index'
 resources :frees
 resources :users
end
