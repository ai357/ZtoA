Rails.application.routes.draw do

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


  namespace :companies do
    resources :employees
    get "/my_page" => "company#show", as: "company"
    resources :schedules
    resources :posts
    resources :comments
    resources :documents, only: [:index, :update]
    # root to: 'homes#top'
  end

  namespace :employees do
    get "/information/edit" => "employees#edit"
    get "/my_page" => "employees#show", as: "employee"
    get "/unsubscribe" => "employees#unsubscribe"
    patch "/withdraw" => "employees#withdraw"
    patch "/information" => "employees#update"
    resources :posts
    resources :comments
    # root to: 'homes#top'
  end
  scope module: :employees do
    resources :employees, except: [:new, :index, :show]
  end
  #get 'homes/top'
  root to: 'homes#top'
end
