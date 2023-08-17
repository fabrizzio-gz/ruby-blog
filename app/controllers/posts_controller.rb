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
    @is_post_author = @post.user_id == session[:user_id]
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    post = Post.where(user_id: session[:user_id]).find(params[:id])

    if post
      post.update(new_post_params)
      flash[:alert] = "Post updated!"
    else
      flash[:alert] = "Couldn't update post!"
    end

    redirect_to post_path(post)
  end

  private

  def new_post_params
    var = params.require(:post).permit(:title, :body)
    var[:user_id] = session[:user_id]
    return var
  end

  def flash_post_created
    flash[:alert] = "Post created!"
  end
end
