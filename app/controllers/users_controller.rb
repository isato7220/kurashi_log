class UsersController < ApplicationController
  def edit
  end

  def show
    @user = current_user
    @posts = current_user.posts.order(created_at: :desc)
  end
end
