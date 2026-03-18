Rails.application.routes.draw do
  devise_for :users

  root to: "homes#top"

  get "mypage", to: "users#show"
  get  "profile/edit", to: "users#edit",   as: :edit_profile
  patch "profile",      to: "users#update", as: :profile

  get "users/search", to: "users#search", as: :user_search

  resources :posts do
    resources :comments, only: [:create, :destroy]
  end

  resources :categories, only: [:index, :new, :create, :edit, :update, :destroy]

  namespace :admin do
    resources :users, only: [:index, :show, :destroy] do
      member do
        patch :toggle_admin
      end
    end
    resources :comments, only: [:index, :destroy]
  end

end