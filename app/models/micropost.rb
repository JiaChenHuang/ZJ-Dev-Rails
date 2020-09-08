class Micropost < ApplicationRecord
  belongs_to :user   # 一篇微博只能属于一个用户
  has_one_attached :image  # 用于上传图片的
  default_scope -> {order(created_at: :desc)}   # 默认以创建时间降序排序
  validates :user_id, presence: true  # 验证user_id是否存在
  validates :content, presence: true, length: {maximum: 140}    # 验证博客内容是否为空、且最大长度不超过140
  validates :image, content_type: { in: %w[image/jpeg image/gif image/png image/jpg image/webp image/svg], message: "图片格式错误"}, 
      size: {  less_than: 10.megabytes, message: "图片大小超过10MB"  }

  # 返回调整尺寸后的图像，供显示
  def display_image
    image.variant(resize_to_limit: [500, 500])
  end
end
