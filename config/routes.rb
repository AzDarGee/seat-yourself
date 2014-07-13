Rails.application.routes.draw do

  # Authentication and Authorization
  resources :sessions, :only => [:new, :create, :destroy]
  resources :owners, :only => [:new,:create,:show,:destroy]
  resources :customers, :only => [:new,:create,:show,:destroy]

  # Static Pages
  get '/about' => "static_pages#about", as: :about
  get '/contact_us' => "static_pages#contact_us", as: :contact_us


  resources :restaurants, shallow: true do
    get :search, on: :collection
    resources :reservations, only: :create
    resources :reviews
  end

  root to: "restaurants#index"


end
