Rails.application.routes.draw do
  resources :questions do
  resources :answers
  end
  resources :answers, only: [:update]
  root to: 'visitors#index'
end
