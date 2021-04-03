class SessionsController < ApplicationController
  def new
  end
  
  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      log_in user
      if user.admin?
        redirect_to users_path
      else
        redirect_to user
      end
    else
      flash[:danger] = "パスワードかメールアドレスが違います"
      render 'new'
    end
  end

  def destroy
    log_out if logged_in?
    redirect_to root_url
  end
end
