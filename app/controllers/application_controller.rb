class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
  helper_method :current_user

  def authorize
    redirect_to '/login' unless current_user
  end

  def session_match
    redirect_to '/' if (current_user.id != params[:id].to_i && !current_user.admin)
  end


  def home
  end
end
