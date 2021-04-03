class StaticpagesController < ApplicationController
  def home
    if logged_in? && current_user.admin?
      redirect_to users_path
    elsif logged_in?
      redirect_to current_user
    elsif
      redirect_to login_path
    end
  end

end
