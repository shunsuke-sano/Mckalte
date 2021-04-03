class ActivitiesController < ApplicationController
  before_action :logged_in_user, only: [:create, :destroy]
  
  def new
    @activity = Activity.new
  end

  def create
    @activity = current_user.activities.build(activity_params)
    if @activity.save
      flash[:success] = "活動登録"
      redirect_to current_user
    else
      flash[:danger] = "活動を選んでください"
      render 'new'
    end
  end

  def show
    @activity = Activity.find(params[:id])
  end
  
  private

  def activity_params
    params.require(:activity).permit(:title, :day, :mctarget, :mccomment, :excomment, :extarget, :basetarget, :basecomment, :fb)
  end

  def correct_user
    @activity = current_user.activities.find_by(id: params[:id])
    redirect_to root_url if @activity.nil?
  end

end
