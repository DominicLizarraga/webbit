require "sidekiq/web"

Rails.application.routes.draw do

  authenticate :user, lambda { |u| u.admin? } do
    namespace :admin do
      mount Sidekiq::Web => '/sidekiq'
      resources :users, only: [:index]
      resources :submissions, only: [:index]
      root to: "users#index"
    end
  end


  resources :communities do
    resource :subscriptions
  end

  resources :submissions do
    member do
      put "upvote", to: "submissions#upvote"
      put "downvote", to: "submissions#downvote"
    end

    resources :comments do
      member do
        put "upvote", to: "comments#upvote"
        put "downvote", to: "comments#downvote"
      end
    end
  end

  # verb path, to: "controller#action"

  get "submissions/unsubscribe/:unsubscribe_hash", to: "submissions#unsubscribe", :as =>
  "comment_unsubscribe"

  devise_for :users

  resources :users, only: [:show], as: "profile"

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: "submissions#index"

  get :search, controller: "application"
end
