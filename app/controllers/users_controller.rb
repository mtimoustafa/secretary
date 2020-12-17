class UsersController < ApplicationController
  skip_before_action :authorise_user

  def create
    @user = User.create(params.require(:user).permit(:username, :password))
    session[:user_id] = @user.id

    redirect_to login_path
  end
end
