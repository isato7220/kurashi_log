class PostsController < ApplicationController

  before_action :set_post, only: [:show, :edit, :update, :destroy]
  before_action :authorize_user!, only: [:edit, :update, :destroy]

def index
  @posts = Post
            .includes(:user, :category)
            .order(created_at: :desc)

  if params[:q].present?
    keyword = "%#{params[:q]}%"

    @posts = @posts.joins(:category).where(
      "posts.title LIKE :q OR posts.memo LIKE :q OR categories.name LIKE :q",
      q: keyword
    )
  end
end


  def new
    @post = Post.new
  end

  def create
    @post = current_user.posts.build(post_params)

    if @post.save
      redirect_to @post, notice: "投稿を作成しました 🌿"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
  end

  def edit
  end

  def update
    if @post.update(post_params)
      redirect_to @post, notice: "更新しました"
    else
      render :edit
    end
  end

  def destroy
    @post.destroy
    redirect_to posts_path, notice: "削除しました"
  end

  private

  def set_post
    @post = Post.find(params[:id])
  end

  def authorize_user!
    redirect_to posts_path unless @post.user == current_user
  end

  def post_params
    params.require(:post).permit(
      :title,
      :body,
      :amount,
      :posted_on,
      :category_id,   # ← categoriesテーブル方式なら追加必須
      :memo

    )
  end

end
