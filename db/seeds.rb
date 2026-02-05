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
