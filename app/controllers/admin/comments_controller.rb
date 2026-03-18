class Admin::CommentsController < ApplicationController
  before_action :authenticate_user!
  before_action :require_admin!

  def index
    @comments = Comment.includes(:user, :post).order(created_at: :desc)

    if params[:user_id].present?
      @comments = @comments.where(user_id: params[:user_id])
      @filter_user = User.find_by(id: params[:user_id])
    end

    if params[:post_id].present?
      @comments = @comments.where(post_id: params[:post_id])
      @filter_post = Post.find_by(id: params[:post_id])
    end

    if params[:q].present?
      keyword = "%#{params[:q]}%"
      @comments = @comments.where("comments.body LIKE :q", q: keyword)
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    redirect_to admin_comments_path(request.query_parameters.except("_method")),
                notice: "コメントを削除しました"
  end
end