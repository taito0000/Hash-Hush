class UsersController < ApplicationController
  
  before_action :baria_user, only: [:edit, :update]
  
  def show
    @user = User.find(params[:id])
    @posts = @user.posts.order(created_at: :desc)
  end
  
  def edit
    @user = User.find(params[:id])
  end
  
  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    redirect_to user_path(@user.id)
  end
  
  
  private

  def user_params
    params.require(:user).permit(:name, :nickname, :introduction, :profile_image)
  end
  
  def baria_user
    if current_user.id != params[:id].to_i
      flash[:notice]="編集権限がありません"
      redirect_to user_path(params[:id])
    end
  end
  
end
