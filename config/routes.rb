Rails.application.routes.draw do
  devise_for :users
  get 'investments/index'
  root to: "investments#index"
end
