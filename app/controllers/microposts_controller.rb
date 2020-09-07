class MicropostsController < ApplicationController
    before_action :logged_in_user, only: [:create, :destroy]   # 前置条件、判断用户是否登录
    before_action :correct_user, only: [:destroy]  # 前置条件、判断当前用户是不是发布人自己

    #  创建自己的博客
    def create
        @micropost = current_user.microposts.build(micropost_params)
        if @micropost.save
            flash[:success] = "微博新建成功"
            redirect_to root_url
        else
            @feed_items = current_user.feed.paginate(page: params[:page])
            render 'static_pages/home'
        end
    end

    #   删除自己的博客
    def destroy
        @micropost.destroy
        flash[:success] = '博客删除成功！'
        redirect_to request.referrer || root_url
        # redirect_back(fallback_location: root_url)
        end


    private



    def micropost_params
        params.require(:micropost).permit(:content)
    end


    def correct_user
        @micropost = current_user.microposts.find_by(id: params[:id])
        redirect_to root_url if @micropost.nil?
    end
end
