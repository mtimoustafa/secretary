class SessionsController < ApplicationController
  skip_before_action :authorise_user

  def index
    redirect_to contacts_path if logged_in?
  end

  def new
    @user = User.new
  end

  def create
    @user = User.find_by(username: params[:username])

    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      return redirect_to contacts_path
    end

    redirect_to login_path, alert: 'Username or password is incorrect.'
  end

  def logout
    session[:user_id] = nil
    redirect_to login_path
  end
end
