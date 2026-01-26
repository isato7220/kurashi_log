class PostsController < ApplicationController
  def new
    @post = Post.new
  end
  
  def create
    @post = current_user.posts.build(post_params)
    if @post.save
      redirect_to @post
    else
      render :new
    end
  end

  def index
    @post = Post.all
  end

  def show
    @post = Post.find(params[:id])
  end

  def edit
  end

  def update
    if @post.update(post_params)
      redirect_to @post
    else
      render :edit
    end
  end

  def destroy
    @post.destroy
    redirect_to posts_path
  end


  before_action :authorize_user!, only: [:edit, :update, :destroy]

def authorize_user!
  redirect_to posts_path unless @post.user == current_user
end
private

def post_params
  params.require(:post).permit(
    :title,
    :body,
    :amount,
    :posted_on
  )
end
private

def post_params
  params.require(:post).permit(
    :title,
    :body,
    :amount,
    :posted_on
  )
end

end
