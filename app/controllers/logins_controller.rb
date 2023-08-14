class LoginsController < ApplicationController
  def new
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

  def login_params
    params.require(:user).permit(:email, :password)
  end

  def save_session
    session[:user_id] = @user.id
  end

  def flash_login_failed
    flash[:alert] = "Login failed"
  end

end
