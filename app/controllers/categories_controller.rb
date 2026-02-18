class CategoriesController < ApplicationController
  before_action :authenticate_user!
  before_action :require_admin!
  before_action :set_category, only: [:edit, :update, :destroy]

  def index
    @categories = Category.order(:id)
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)

    if @category.save
      redirect_to categories_path, notice: "カテゴリを追加しました"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @category.update(category_params)
      redirect_to categories_path, notice: "カテゴリを更新しました"
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    if @category.posts.exists?
      redirect_to categories_path, alert: "使用中のカテゴリは削除できません"
    else
      @category.destroy
      redirect_to categories_path, notice: "カテゴリを削除しました"
    end
  end

  private

  def set_category
    @category = Category.find(params[:id])
  end

  def category_params
    params.require(:category).permit(:name)
  end
end
