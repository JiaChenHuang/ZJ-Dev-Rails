class StaticPagesController < ApplicationController

  # 首页

  def home
    if logged_in?
      @micropost = current_user.microposts.build
      @feed_items = current_user.feed.paginate(page: params[:page],per_page:10)
      end
  end

  # 帮助
  def help
  end

  # 关于
  def about
  end

  # 联系
  def contact
    
  end
  
end
