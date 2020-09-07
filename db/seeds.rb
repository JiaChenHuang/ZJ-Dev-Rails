# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


# 创建一个超级用户
User.create!(name: "root",
    email: "root@gmail.com",
    password: "123123",
    password_confirmation: "123123",
    admin: true,
    activated:true,
    activated_at:Time.zone.now)
# 创建一堆普通用户
29.times do |n|
    name = Faker::Name.name
    email = "user-#{n+1}@gmail.com"
    password = "123123"
    User.create!(name: name,
    email: email,
    password: password,
    password_confirmation: password,
    admin: false,
    activated:true,
    activated_at:Time.zone.now)
    end
    # 为部分用户生成微博
    users = User.order(:created_at).take(6)
    30.times do
    content = Faker::Lorem.sentence(word_count: 5)
    users.each { |user| user.microposts.create!(content: content) }
end