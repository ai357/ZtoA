Rails.application.routes.draw do

  #企業用
  devise_for :companies, controllers: {
    registrations: "company/registraitons",
    sessions: 'company/sessions'
  }

  #利用者用
  devise_for :users, controllers: {
    registrations: "user/registraitons",
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
