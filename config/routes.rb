Rails.application.routes.draw do
  get 'password_resets/new'
  get 'password_resets/edit'
  root 'static_pages#home'
  get 'help' => 'static_pages#help'
  get 'about' => 'static_pages#about'
  get 'contact' => 'static_pages#contact'
  get 'signup' => 'users#new'
  get 'login' => 'sessions#new'
  post 'login' => 'sessions#create'
  delete 'logout' => 'sessions#destroy'
  resources :users do
    member do
      get :following, :followers
    end
  end
  resources :account_activations, only: [:edit]
  resources :password_resets, only: [:new, :create, :edit, :update]
  # resources :microposts, only: [:create, :destroy]
  resources :micropost, except: :index do
    resources :comments,  only: %i[new create destroy], module: :microposts
  end
  resources :relationships, only: [:create, :destroy]

  resources :comments, only: [] do
    resources :comments,  only:   %i[new create destroy], module: :comments
  end
end
