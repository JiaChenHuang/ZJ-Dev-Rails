class PasswordResetsController < ApplicationController
  before_action :get_user, only: %i[edit update]
  before_action :valid_user, only: %i[edit update]
  def new; end

  def create
    @user = User.find_by(email: params[:password_reset][:email].downcase)
    if @user
      @user.create_reset_digest
      @user.send_password_reset_email
      flash[:info] = '密码重置链接已发送至您的邮箱、请前往邮箱查看'
      redirect_to root_url
    else
      flash.now[:danger] = '找不到电子邮件地址'
      render 'new'
    end
  end

  def edit; end

  private

  def get_user
    @user = User.find_by(email: params[:email])
  end

  # 确保是有效用户
  def valid_user
    redirect_to root_url unless @user&.activated? && @user&.authenticated?(:reset, params[:id])
  end
end
