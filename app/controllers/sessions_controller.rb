class SessionsController < ApplicationController
  def new; end

  def create # 注册用户
    user = User.find_by(email: params[:session][:email].downcase)
    if user&.authenticate(params[:session][:password])
      if user.activated?
        log_in user
        remember user
        params[:session][:remember_me] == '1' ? remember(user) : forget(user)
        redirect_back_or user
      else
        message = '账户未激活'
        message += '请检查您的电子邮箱激活链接点击激活您的账户'
        flash[:warning] = message
        redirect_to root_url # 登入用户，然后重定向到用户的资料页面
      end
    else
      # 创建一个错误消息
      flash.now[:danger] = '电子邮箱或者密码错误'
      render 'new'
    end
  end

  def destroy # 退出用户
    log_out if logged_in?
    redirect_to root_url
  end
end
