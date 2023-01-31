Rails.application.routes.draw do

  devise_for :admins, controllers: {
    sessions: 'admins/sessions'
  }


  #企業用
  devise_for :companies, controllers: {
    registrations: "companies/registrations",
    sessions: 'companies/sessions'
  }

  #利用者用
  devise_for :employees, controllers: {
    registrations: "employees/registrations",
    sessions: "employees/sessions"
  }
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  namespace :admins do
    resources :companies
  end

  devise_scope :admin do
    get '/admins', to: 'admins/sessions#new'
  end


  namespace :companies do
    resources :employees do
      # do endで囲むことで親子関係ができて、documentがemployeesに属している状態
      resources :documents, only: [:index, :update]
      patch "submission_status_update/:id" => "documents#submission_status_update", as: "submission_status_update"
    end
    get "/my_page" => "company#show", as: "company"
    resources :schedules
    resources :posts do
      resources :comments
    end
    resources :notifications
    get "/message" => "messages#index"
  end

  namespace :employees do
    get "/information/edit" => "employees#edit"
    get "/my_page" => "employees#show", as: "employee"
    get "/unsubscribe" => "employees#unsubscribe"
    patch "/withdraw" => "employees#withdraw"
    patch "/information" => "employees#update"
    resources :notifications
    resources :posts do
    resources :comments
  end
  end
  scope module: :employees do
    resources :employees, except: [:new, :index, :show]
  end
  root to: 'homes#top'
end
