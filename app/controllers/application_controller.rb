class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery(:with => :exception)

  helper_method(:current_user)

  rescue_from CanCan::AccessDenied do
    alert_msg = "Not authorized. Log in and try again."
    if request.env["HTTP_REFERER"]
      redirect_to(:back, :alert => alert_msg)
    else
      redirect_to(root_url, :alert => alert_msg)
    end
  end

  private

  def current_user
    @user ||= User.find(session[:user_id]) if session[:user_id]
  end
end

