class UsersController < ApplicationController
  before_action :authenticate_user!




def show
  @user = current_user


  start_date = params.fetch(:start_date, Date.today).to_date
  @calendar_posts = @user.posts.where(
    posted_on: start_date.beginning_of_month..start_date.end_of_month
  )


  if params[:date].present?
    @selected_date = params[:date].to_date
    @posts = @user.posts.where(posted_on: @selected_date)
  else
    @posts = @user.posts
  end
end
  def edit
    @user = current_user
  end

  def update
    @user = current_user

    if @user.update(user_params)
      redirect_to mypage_path, notice: "プロフィールを更新しました"
    else
      render :edit, status: :unprocessable_entity
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email)
  end
end
