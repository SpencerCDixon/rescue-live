class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  # def authorize_user!
    # if !user_signed_in?
      # flash[:alert] = "You don't have access to this page"
      # redirect_to root_path
    # end
  # end

  # def authorize_admin!
    # if !user_signed_in? || !current_user.admin?
      # flash[:alert] = "You don't have access to this page"
      # redirect_to root_path
    # end
  # end
end
