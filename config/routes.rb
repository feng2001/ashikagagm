Rails.application.routes.draw do
  get 'sessions/new'

  root to: 'static_pages#home'
  get    'signup', to: 'users#new'
  get    'login' , to: 'sessions#new'
  post   'login' , to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
  
  #get   'edit' , to: 'users#edit'
  #patch 'edit' , to: 'users#update'
  #put   'edit' , to: 'users#update'
  
  resources :users do
    member do
      get 'followings'
      get 'followers'
    end
  end
  
  resources :microposts
  resources :relationships, only: [:create, :destroy]

end