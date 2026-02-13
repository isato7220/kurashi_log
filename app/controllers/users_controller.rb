class UsersController < ApplicationController
  before_action :authenticate_user!

  def show
    @user = current_user
    @posts = current_user.posts.order(created_at: :desc)
  end

  def edit
    @user = current_user
  end

  def update
    @user = current_user

    if @user.update(user_params)
      redirect_to mypage_path, notice: "プロフィールを更新しました 🌿"
    else
      render :edit, status: :unprocessable_entity
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email)
  end
end
