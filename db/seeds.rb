Admin.create!(
  email: 'a@a',
  password: '000000'
)
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


#Item.find_or_create_by!(name: "ショートケーキ") do |item|
  #item.introduction = "イチゴと生クリームの甘さがたまらない商品です。"
  #item.price = "450"
  #item.genre_id = 1
#end

#Item.find_or_create_by!(name: "王様プリン") do |item|
  #item.introduction = "今日はチョットだけいい気分～♪"
  #item.price = "245"
  #item.genre_id = 2
#end

#Item.find_or_create_by!(name: "マラサダドーナツ") do |item|
  #item.introduction = "ハワイ生まれの揚げドーナツです。"
  #item.price = "257"
  #item.genre_id = 3
#end

#Item.find_or_create_by!(name: "チョコレートケーキ") do |item|
  #item.introduction = "厳選したチョコレートを使ったこだわりの一品。"
  #item.price = "613"
  #item.genre_id = 1
#end

#Item.find_or_create_by!(name: "バスクチーズケーキ") do |item|
  #item.introduction = "美味しくないわけないだろ！チーズケーキなんだから！"
  #item.price = "597"
  #item.genre_id = 1
#end

Genre.find_or_create_by!(genre_name: "ケーキ") do |genre|
end

Genre.find_or_create_by!(genre_name: "プリン") do |genre|
end

Genre.find_or_create_by!(genre_name: "ドーナツ") do |genre|
end