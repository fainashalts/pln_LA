class ApplicationController < ActionController::Base
  before_action :require_login
  before_action :correct_user
  before_action :admin


  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  include SessionsHelper
  
#   helper_method :current_user

#   def current_user
#   	@current_user ||= User.find(session[:user_id]) if
# 		session[:user_id]
#   	end

  private
  def require_login
  	unless logged_in?
  		flash[:notice] = "You must be logged in to do that!"
  		redirect_to login_path
  	end	
  end

  def correct_user
  	@user = User.find(params[:id])
  	unless @user == current_user || current_user.admin?
  		redirect_to(users_path) 
      flash[:error] = "You cannot edit other users!"
    end
  end

  def admin
    unless current_user.admin
      redirect_to activities_path 
      flash[:admin] = "Must be administrator to do that!"
    end
  end
end
