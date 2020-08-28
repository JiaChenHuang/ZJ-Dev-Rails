class UsersController < ApplicationController
  # 注册
  def new
    @user = User.new
  end
  # 显示
  def show
    @user = User.find(params[:id])
  end
# 实现注册
def create 
  @user = User.new(user_params)
  if @user.save
    flash[:success] = "Welcome to the Sample App"
    redirect_to  @user
  else 
    render "new"
  end
end
private
def user_params
         params.require(:user).permit(:name, :email, :password, :password_confirmation)
end
end
