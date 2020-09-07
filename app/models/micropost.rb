class Micropost < ApplicationRecord
  belongs_to :user   # 一篇微博只能属于一个用户
  default_scope -> {order(created_at: :desc)}   # 默认以创建时间降序排序
  validates :user_id, presence: true  # 验证user_id是否存在
  validates :content, presence: true, length: {maximum: 140}    # 验证博客内容是否为空、且最大长度不超过140
end
