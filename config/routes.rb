Rails.application.routes.draw do
  get 'users/edit'
  get 'users/show'
  get 'categories/index'
  get 'categories/show'
  get 'posts/new'
  get 'posts/index'
  get 'posts/show'
  get 'posts/edit'
  get 'homes/top'
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: "homes#top"
end
