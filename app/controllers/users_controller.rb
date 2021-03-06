class UsersController < ApplicationController
  before_action :logged_in_user, only: %i[edit update index destroy] # 当用户未登录时禁止访问(用户编辑页、用户更新资料、用户详情页)
  before_action :correct_user, only: %i[edit update]
  before_action :admin_user, only: [:destroy] # 让管理员才能删除其他普通用户
  before_action :logged_in_user, only: [:index, :edit, :update, :destroy,:following, :followers]

  def index
    @users = User.paginate(page: params[:page], per_page: 10) #  设置每页显示条数
  end

  def new # 注册
    @user = User.new
  end

  def show # 显示
    @user = User.find(params[:id])
    @microposts = @user.microposts.paginate(page: params[:page], per_page: 10)
  end

  def create
    @user = User.new(user_params)
    if @user.save
      @user.send_activation_email
      flash[:info] = '请登录您的电子邮箱确认激活您的账户'
      redirect_to root_url
    else
      render 'new'
    end
  end

  def edit # 编辑用户 users/1/edit
    @user = User.find(params[:id])
  end

  def update # 更新用户
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:success] = '用户资料更新成功！'
      redirect_to @user
    else
      render 'edit'
    end
  end

  def destroy # 删除用户
    User.find(params[:id]).destroy
    flash[:danger] = '用户已删除！'
    redirect_to users_url
  end

  def following   # 我关注的人
    @title = "Following"
    @user = User.find(params[:id])
    @users = @user.following.paginate(page: params[:page],per_page: 10)
    render 'show_follow'
    end


    def followers   #我的粉丝
    @title = "Followers"
    @user = User.find(params[:id])
    @users = @user.followers.paginate(page: params[:page],per_page: 10)
    render 'show_follow'
    end


  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end

  # 确保是正确的用户
  def correct_user
    @user = User.find(params[:id])
    redirect_to(root_url) unless current_user?(@user)
  end

  #  确保是管理员
  def admin_user
    redirect_toroot_url unless current_user.admin?
  end

  # 创建令牌和摘要
  def create_activation_digest; end
end
