Rails.application.routes.draw do
  resources :communities

  resources :submissions do
    resources :comments
  end

  devise_for :users

  resources :users, only: [:show], as: "profile"

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: "submissions#index"
end
