# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


# 用户
User.create!(name: "Admin",
  email: "root@gmail.com",
  password: "123123",
  password_confirmation: "123123",
  admin: true,
  activated: true,
  activated_at: Time.zone.now)
  99.times do |n|
  name = Faker::Name.name
  email = "user-#{n+1}@gmail.com"
  password = "123123"
  User.create!(name: name,
  email: email,
  password: password,
  password_confirmation: password,
  admin: false,
  activated: true,
  activated_at: Time.zone.now)
  end
  # 微博
  users = User.order(:created_at).take(6)
  50.times do
  content = Faker::Lorem.sentence(word_count: 5)
  users.each { |user| user.microposts.create!(content: content) }
  end
# 创建关注关系
users = User.all
user = users.first
following = users[2..50]  #第一个用户关注第 3-51 个用户
followers = users[3..40]  #第 4-41 个用户关注第一个用户
following.each { |followed| user.follow(followed) }
followers.each { |follower| follower.follow(user) }