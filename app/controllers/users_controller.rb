class UsersController < ApplicationController
  before_action :logged_in_user, only: [:show]
  before_action :admin_user, only: [:index]

  def index
    @users = User.all
  end

  def new
    @user = User.new
  end
  
  def create
    @user = User.new(user_params)
    if @user.save
      log_in @user
      flash[:success] = "Welcome to mc-zemi!"
      redirect_to @user
    else 
      render 'new'
    end
  end

  def show
    @user = User.find(params[:id])
    @activities = @user.activities.all.order(created_at: :desc)
  end

  private 
  
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :grade)
  end

  

end
