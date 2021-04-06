class ActivitiesController < ApplicationController
  before_action :logged_in_user, only: [:create, :destroy, :edit, :update]
  before_action :correct_user, only: [:destroy]
  before_action :admin_user, only: [:index]
  
  def index
    @activities = Activity.all.order(updated_at: :desc)
  end

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
    @date = @activity.date
  end
  
  def edit
    @activity = Activity.find(params[:id])
  end

  def update
    @activity = Activity.find(params[:id])
    @user = @activity.user
    if @activity.update(activity_params)
      if current_user.admin?
        flash[:success] = "コメントを追加しました"
        redirect_to activities_url
      else 
        flash[:success] = " カルテを更新しました"
        redirect_to @user
      end
    else
      render 'edit'
    end
  end
  
  def destroy
    @activity.destroy
    flash[:success] = "カルテを削除しました"
    redirect_to current_user
  end

  private

  def activity_params
    params.require(:activity).permit(:title, :date, :mctarget, :mccomment, :excomment, :extarget, :basetarget, :basecomment, :fb, :impression)
  end

  def correct_user
    @activity = current_user.activities.find_by(id: params[:id])
    redirect_to root_url if @activity.nil?
  end

end
