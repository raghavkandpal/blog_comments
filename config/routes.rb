Rails.application.routes.draw do
  get 'add' => 'blogs#new'
  resources :blogs do
    resources :comments
  end
  get 'myposts' => 'blogs#myposts'
  get 'signup' => 'users#new'
  resources :users
  get 'login' => 'sessions#new'
  post 'login' => 'sessions#create'
  delete 'logout' => 'sessions#destroy'

  root 'blogs#index'
end

