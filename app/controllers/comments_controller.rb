class CommentsController < ApplicationController
  before_action :authenticate_user!

  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.build(comment_params)
    @comment.user = current_user

    if @comment.save
      redirect_to @post
    else
      redirect_to @post, alert: "コメントを入力してください"
    end
  end

  def destroy
    @post = Post.find(params[:post_id])
    @comment = @post.comments.find(params[:id])
    if @comment.user == current_user || current_user.admin?
      @comment.destroy
      redirect_to @post, notice: "コメントを削除しました"
    else
      redirect_to @post, alert: "権限がありません"
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:body)
  end
end