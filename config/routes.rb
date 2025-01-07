Rails.application.routes.draw do
  devise_for :admin, skip: [:registrations, :password], controllers: {
    sessions: 'admin/sessions'
  }
 
  namespace :admin do
    root 'dashboards#index'
    get 'dashboards', to: 'dashboards#index'
    resources :users, only: [:destroy]
    resources :comments, only: [:index, :destroy]
  end

  devise_for :users
  resources :users, only: [:edit, :show]
  resources :posts do
    resource :favorites, only: [:create, :destroy]
    resource :comments, only: [:create, :destroy, :update]
  end
  resources :comments, only: [:destroy]
  root to: 'homes#top'
  get 'about' => 'homes#about'
  get 'search' => 'posts#search'

  
  
  #get 'search' => 'application#search'
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
