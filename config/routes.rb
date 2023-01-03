Rails.application.routes.draw do

  namespace :company do
    get 'user/index'
  end
  get 'homes/top'
  #企業用
  devise_for :companies, controllers: {
    registrations: "company/registrations",
    sessions: 'company/sessions'
  }

  #利用者用
  devise_for :users, controllers: {
    registrations: "user/registrations",
    sessions: "user/sessions"
  }
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
