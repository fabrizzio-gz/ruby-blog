class PostsController < ApplicationController
  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(new_post_params)

    if @post.save
      flash_post_created
      return redirect_to posts_path
    end
    flash[:alert] = "Couldn't create the post!"
    render :new, status: :unprocessable_entity
  end

  def show
    @post = Post.find(params[:id])
  end

  def edit
  end

  private

  def new_post_params
    var = params.require(:post).permit(:title, :body, :user_id)
    var[:user_id] = session[:user_id]
    return var
  end

  def flash_post_created
    flash[:alert] = "Post created!"
  end
end
