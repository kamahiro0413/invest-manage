Rails.application.routes.draw do
  devise_for :users
  root to: "groups#index"
  resources :groups, only: [:new,:create] do
    resources :investments, only: [:index, :create, :new, :show]
  end
end
