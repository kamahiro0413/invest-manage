Rails.application.routes.draw do
  devise_for :users
  root to: "groups#index"
  resources :groups do
    resources :investments do
      resources :comments,only: [:destroy,:create]
    end
  end
  resources :users, only: :show
end
