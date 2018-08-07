Rails.application.routes.draw do
  
  resources :topics do
    resources :posts, except: [:index]
  end
  
  resources :users, only: [:new, :create]
  post 'users/confirm' => 'users#confirm' 
          # path => action
  get 'about' => 'welcome#about'
  root 'welcome#index'
end
