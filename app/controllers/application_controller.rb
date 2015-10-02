class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_filter :require_login
  # before_filter :require_admin, only: [:destroy]

  private
  # def require_admin
  #   current_user.admin?
  # end

  def not_authenticated
    redirect_to login_path, alert: "Please login first"
  end
end
