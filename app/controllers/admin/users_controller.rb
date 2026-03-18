class Admin::UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :require_admin!
  before_action :set_user, only: [:show, :destroy, :toggle_admin]

  def index
    @users = User.order(:created_at)
    if params[:q].present?
      keyword = "%#{params[:q]}%"
      @users = @users.where("name LIKE :q OR email LIKE :q", q: keyword)
    end
  end

  def show
    @posts = @user.posts.includes(:category).order(created_at: :desc)
  end

  def destroy
    if @user == current_user
      redirect_to admin_users_path, alert: "自分自身は削除できません"
      return
    end
    @user.destroy
    redirect_to admin_users_path, notice: "#{@user.name} を削除しました"
  end

  def toggle_admin
    if @user == current_user
      redirect_to admin_users_path, alert: "自分自身のadmin権限は変更できません"
      return
    end
    @user.update!(admin: !@user.admin?)
    status = @user.admin? ? "付与" : "剥奪"
    redirect_to admin_users_path, notice: "#{@user.name} のadmin権限を#{status}しました"
  end

  private

  def set_user
    @user = User.find(params[:id])
  end
end