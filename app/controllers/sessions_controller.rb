class SessionsController < ApplicationController
  def new
  end

  def create  # 注册用户
    user = User.find_by(email: params[:session][:email].downcase)
    if user&.authenticate(params[:session][:password])
        log_in user
        redirect_to user
      # 登入用户，然后重定向到用户的资料页面
      else
      # 创建一个错误消息
        flash.now[:danger] = '电子邮箱或者密码错误' 
        render 'new'
    end
  end

  def destroy   # 退出用户
    log_out
    redirect_to root_url
  end
end
