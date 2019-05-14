Rails.application.routes.draw do
  resources :lessons, only: [:show, :index] do
    resources :contributions, only: [:new, :create, :edit, :update]
  end
  
  devise_for :users

end
