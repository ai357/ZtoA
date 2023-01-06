Rails.application.routes.draw do




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
  get 'user/index'
  get "/my_page" => "company#show", as: "company"
  resources :schedules
  resources :posts
  resources :comments
  # root to: 'homes#top'
  end


  namespace :user do
  get "/my_page" => "user#show", as: "user"
  get "/information/edit" => "users#edit"
  get "/unsubscribe" => "users#unsubscribe"
  patch "/withdraw" => "users#withdraw"
  patch "/information" => "users#update"
  resources :users, except: [:new, :index]
  resources :posts
  resources :comments
  # root to: 'homes#top'
  end

  #get 'homes/top'
  root to: 'homes#top'

end
