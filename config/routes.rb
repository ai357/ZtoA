Rails.application.routes.draw do
  devise_for :companies
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  
  
  namespace :company do
  resources :schedules
  resources :posts
  resources :comments
  root to: 'homes#top'
  end
  
  
  namespace :user do
  resources :users
  resources :posts
  resources :comments
  root to: 'homes#top'
  end
  
  
  
end
