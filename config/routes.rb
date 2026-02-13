Rails.application.routes.draw do
  devise_for :users

  root to: "homes#top"

  get "mypage", to: "users#show"
get  "profile/edit", to: "users#edit",   as: :edit_profile
patch "profile",      to: "users#update", as: :profile


  resources :posts do
    resources :comments, only: [:create, :destroy]
  end

  resources :categories, only: [:index, :show]
end
