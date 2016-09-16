class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def admin_user
    @admin_user ||= User.first
  end

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def admin_users_pick(performance)
    admin_user.performances.find_by_id(performance.id) if admin_user
  end

  def current_users_pick(performance)
    current_user.performances.find_by_id(performance.id) if current_user
  end

  helper_method :admin_user, :current_user, :admin_users_pick, :current_users_pick
end
