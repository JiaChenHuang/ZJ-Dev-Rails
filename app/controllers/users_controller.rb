class UsersController < ApplicationController
  # 注册
  def new
    @user = User.new
  end
  # 显示
  def show
    @user = User.find(params[:id])
    # debugger
  end
  # Ruby on Rails 247
end
