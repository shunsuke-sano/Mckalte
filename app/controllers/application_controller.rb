class ApplicationController < ActionController::Base
  include SessionsHelper

  private
  def logged_in_user
    unless logged_in?
      flash[:danger] = "ログインしてください"
      redirect_to login_url
    end
  end
  
  def admin_user
    redirect_to root_path unless current_user.admin?
  end
end
