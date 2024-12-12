Rails.application.routes.draw do
  devise_for :admin, skip: [:registrations, :password], controllers: {
    sessions: 'admin/sessions'
  }
 
  namespace :admin do
    get 'dashboards', to: 'dashboards#index'
    resources :users, only: [:destroy]
  end

  devise_for :users
  resources :users, only: [:edit, :show]
  resources :posts do
    resource :favorite, only: [:create, :destroy]
    resource :comments, only: [:create]
  end
  resources :comments, only: [:destroy]
  root to: 'homes#top'
  get 'about' => 'homes#about'
  get 'search' => 'posts#search'

  
  
  #get 'search' => 'application#search'
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
