class User < ApplicationRecord
  attr_accessor :remember_token

  before_save { email.downcase! }
  validates :name, presence: true, length: {maximum: 50}
  # VALID_EMAIL_REGEX = /^[A-Za-z\d]+([-_.][A-Za-z\d]+)*@([A-Za-z\d]+[-.])+[A-Za-z\d]{2,4}$/i
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
  validates :email, presence: true, length: {maximum: 255}, format: {with: VALID_EMAIL_REGEX}, uniqueness: true
  has_secure_password
  validates :password, presence: true, length: {minimum: 6}, allow_nil: true


  
  def self.digest(string)  # 返回指定字符串的哈希摘要
    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
             BCrypt::Engine.cost
    BCrypt::Password.create(string, cost: cost)
  end

  def self.new_token #返回一个随机令牌
    SecureRandom.urlsafe_base64
  end

def remember  # 为了持久保存会话，在数据库中记住用户
  self.remember_token = User.new_token
  update_attribute(:remember_digest, User.digest(remember_token))
  end

  
def authenticated?(remember_token)  # 如果指定的令牌和摘要匹配，返回 true
  return false if remember_digest.nil?
  BCrypt::Password.new(remember_digest).is_password?(remember_token)
  end

  def forget   # 忘记用户
    update_attribute(:remember_digest, nil)
  end
end