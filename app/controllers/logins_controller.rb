class LoginsController < ApplicationController
  def new
    redirect_if_logged_in
    @user = User.new
  end

  def create
    @user = User.find_by(login_params)
    if @user
      save_session
      return redirect_to posts_path
    end
    flash_login_failed
    redirect_to new_login_path
  end

  private

  def redirect_if_logged_in
    id = session[:user_id]
    user = User.find_by(id: id)
    if user
      redirect_to posts_path
    end
  end

  def login_params
    params.require(:user).permit(:email, :password)
  end

  def save_session
    session[:user_id] = @user.id
    session[:user_email] = @user.email
  end

  def flash_login_failed
    flash[:alert] = "Login failed"
  end

end
