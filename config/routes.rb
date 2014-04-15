Twitter::Application.routes.draw do
  get 'signup', to: 'users#new', as: 'signup'
  get 'login', to: 'sessions#new', as: 'login'
  get 'logout', to: 'users#destroy', as: 'logout'

  root :to => 'tweets#index'

  resources :users do
    resources :tweets
    resources :followers, :only => [:create, :destroy]
  end

  resources :sessions

end
