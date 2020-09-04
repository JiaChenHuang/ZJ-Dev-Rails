class UsersController < ApplicationController
 
  before_action :logged_in_user, only: [:edit, :update, :index, :destroy]   # 当用户未登录时禁止访问(用户编辑页、用户更新资料、用户详情页)
  before_action :correct_user, only: [:edit, :update]
  before_action :admin_user, only: [:destroy]  # 让管理员才能删除其他普通用户

def index
    @users = User.paginate(page: params[:page])
end

  
  def new  # 注册
    @user = User.new
  end
  
  def show # 显示
    @user = User.find(params[:id])
  end

  def create
    @user = User.new(user_params)
    if @user.save
    log_in @user
    # flash[:success] = "欢迎登录"
    flash[:success] = "欢迎登录#{@user.name}！"    # 注册成功后第一次登录显示欢迎提示并显示当前用户名
    redirect_to @user
    else
    render 'new'
    end
    end

def edit  # 编辑用户 users/1/edit
    @user = User.find(params[:id])
end

def update   # 更新用户
  @user = User.find(params[:id])
  if @user.update(user_params)
    flash[:success] = "用户资料更新成功！"
    redirect_to @user
  else
  render 'edit'
  end
  end


  def destroy   # 删除用户
    User.find(params[:id]).destroy
    flash[:danger] = "用户已删除！"
    redirect_to users_url
end


private
def user_params
         params.require(:user).permit(:name, :email, :password, :password_confirmation)
end

# 确保用户已经登录
def logged_in_user
  unless logged_in?
    store_location
  flash[:danger] = "请登录！"
  redirect_to login_url
  end
  end

# 确保是正确的用户
def correct_user
@user = User.find(params[:id])
redirect_to(root_url) unless current_user?(@user)
end

#  确保是管理员
def admin_user
  redirect_to (root_url) unless current_user.admin?
end


end
