class ApplicationController < ActionController::Base

  private 
  def current_user
    if session[:user_id].present?
      @current_user ||= User.find_by(id: session[:user_id])
    end
  end
  helper_method :current_user

  def authenticate_user!
    unless current_user.present?
      flash[:danger] = "Please sign in"
      redirect_to new_session_path
    end
  end

  def user_signed_in?
    current_user.present?
  end
  helper_method :user_signed_in? 
  
end
