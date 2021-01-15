Rails.application.routes.draw do
  get 'investments/index'
  root to: "investments#index"
end
