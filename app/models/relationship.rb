class Relationship < ApplicationRecord
  belongs_to :follower, class_name: "User"
  belongs_to :followed, class_name: "User"
  validate :follower_id, presence: true
  validate :followed_id, presence: true
end
