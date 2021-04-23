class CommentsController < ApplicationController
  def index
    @user = User.find_by(params[:user_id])
    @comments = @user.comments.all
  end

  def new
    @comment = Comment.new
  end

  def create
    @user = User.find_by(params[:comment][:user_id])
    @comment = @user.comments.build(comment_params)
    if @comment.save
      flash[:success] = "コメカを送信しました"
      redirect_to current_user
    else
      render 'new'
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:user_id, :goodpoint, :badpoint, :free, :from)
  end

  
end
