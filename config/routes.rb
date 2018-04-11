Rails.application.routes.draw do
  root to: 'posts#index'

  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
  
  get 'signup', to: 'restaurants#new'
  resources :restaurants, only: [:show, :create] do
    member do
      get :draft_posts
    end
  end
  
  resources :posts
end
