# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Category.destroy_all

Category.create!(name: "食費")
Category.create!(name: "家賃")
Category.create!(name: "光熱費")
Category.create!(name: "通信費")
Category.create!(name: "日用品")
Category.create!(name: "娯楽")
Category.create!(name: "その他")

# テストユーザー2人
user1 = User.find_or_create_by!(email: "test1@example.com") do |u|
  u.name = "テストユーザー1"
  u.password = "password"
  u.password_confirmation = "password"
  u.confirmed_at = Time.current
end

user2 = User.find_or_create_by!(email: "test2@example.com") do |u|
  u.name = "テストユーザー2"
  u.password = "password"
  u.password_confirmation = "password"
  u.confirmed_at = Time.current
end


# 投稿（各ユーザー2件ずつ）
Post.find_or_create_by!(title: "テスト投稿1-1", user: user1) do |p|
  p.memo = "ユーザー1の1件目のメモ"
end

Post.find_or_create_by!(title: "テスト投稿1-2", user: user1) do |p|
  p.memo = "ユーザー1の2件目のメモ"
end

Post.find_or_create_by!(title: "テスト投稿2-1", user: user2) do |p|
  p.memo = "ユーザー2の1件目のメモ"
end

Post.find_or_create_by!(title: "テスト投稿2-2", user: user2) do |p|
  p.memo = "ユーザー2の2件目のメモ"
end
