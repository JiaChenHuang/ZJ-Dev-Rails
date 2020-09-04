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
    password: "123456",
    password_confirmation: "123456",
admin: true)
    # 创建一堆普通用户
    99.times do |n|
    name = Faker::Name.name
    email = "user-#{n+1}@gmail.com"
    password = "123123"
    User.create!(name: name,
    email: email,
    password: password,
    password_confirmation: password,
admin: false)
    end