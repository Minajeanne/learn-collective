Rails.application.routes.draw do
  resources :lessons, only: [:show, :index] do
    resources :contributions, only: [:create]
  end
  
  resources :contributions, only: [:edit, :update, :destroy]
  devise_for :users
end
