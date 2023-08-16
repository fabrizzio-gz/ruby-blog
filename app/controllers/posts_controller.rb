class PostsController < ApplicationController
  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.create(new_post_params)
    if @post
      flash_post_created
      return redirect_to posts_path
    end
  end

  def show
    @post = Post.find(params[:id])
  end

  def edit
  end

  private

  def new_post_params
    params.require(:post).permit(:title, :body, :user_id)
  end

  def flash_post_created
    flash[:alert] = "Post created!"
  end
end
