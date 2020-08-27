class User < ApplicationRecord
    before_save {email.downcase!}
    validates :name , presence:true, length: {maximum: 50}
    # VALID_EMAIL_REGEX = /^[A-Za-z\d]+([-_.][A-Za-z\d]+)*@([A-Za-z\d]+[-.])+[A-Za-z\d]{2,4}$/i
    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
    validates :email , presence:true, length: {maximum: 255},format: { with: VALID_EMAIL_REGEX }, uniqueness: true
    has_secure_password
    validates :password, presence: true, length: { minimum: 6 }
end