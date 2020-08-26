module StaticPagesHelper
    # 根据所在页面返回完整标题
    def full_title(page_title = '')
        base_title = "Ruby on Rails "
        # if page_title.empty?
        #     base_title
        # else
        # page_title + " | " + base_title
        # end
        # .empty? 是一个方法、后面必须跟一个问号、说明该方法返回的值是一个布尔类型、即true或者false
        # 如果视图中没有定义页面的标题、full_title 返回标题的公共部分、即Ruby on Rails 、如果定义了、则在变动部分后面加上一个竖线，
        page_title.empty? ? base_title : page_title + " | " + base_title
    end


    
end
