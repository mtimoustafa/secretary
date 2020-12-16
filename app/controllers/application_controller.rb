class ApplicationController < ActionController::Base
  helper_method :current_user
  helper_method :logged_in?

  before_action :authorise_user

  def current_user
    User.find_by(id: session[:user_id])
  end

  def logged_in?
    current_user.present?
  end

  def authorise_user
    redirect_to login_path unless logged_in?
  end
end
