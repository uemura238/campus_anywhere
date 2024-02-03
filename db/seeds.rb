# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# Micropost.create(:univ => 'goo', :content => 'hi')
# Micropost.create(:univ => 'hoo', :content => 'ho')
# Micropost.create(:univ => 'nno', :content => 'he')

# メインのサンプルユーザーを1人作成する
# User.create!(name:  "Guest",
#   email: "example@port.com",
#   password:              "foobar",
#   password_confirmation: "foobar")

# 追加のユーザーをまとめて生成する
99.times do |n|
name  = Faker::Name.name
status_message = "こんにちは！"
email = "example-#{n+1}@port.com"
password = "password"
User.create!(name:  name,
    status_message: status_message,
    email: email,
    status_message: status_message,
    password:              password,
    password_confirmation: password)
end
# ユーザーの一部を対象にマイクロポストを生成する
users = User.order(:created_at).take(6)
1.times do
  univ = "桜大学"
  content = "アクセスも立地も周辺環境もとても良いと感じます。空きコマなどの時間には大学付近のカフェに行ってランチをしたりして楽しんでいます。"
  users.each { |user| user.microposts.create!(univ: univ, content: content) }
end

1.times do
  univ = "みらいテクノロジー大学"
  content = "最近大学は再開発しており、次々に新しい病棟や施設が出来てきているので、施設は比較的新しいものが多くなってきた。ただし、キャンパスの広さとしてはあまり大規模な大学ではない。図書館や勉強スペースはもちろんある。"
  users.each { |user| user.microposts.create!(univ: univ, content: content) }
end

1.times do
  univ = "緑ヶ丘大学"
  content = "キャンパスについては建物が最近立て直されたため、とても綺麗である。清掃員の方が綺麗に清掃してくださっているため、トイレや講義室なども綺麗で心地よい空間である。	"
  users.each { |user| user.microposts.create!(univ: univ, content: content) }
end

1.times do
  univ = "海洋研究大学"
  content = "	キャンパスでもそれほど不自由はせずに充実している方だと思います。設備に関しても問題はありません。"
  users.each { |user| user.microposts.create!(univ: univ, content: content) }
end

1.times do
  univ = "工芸学園大学"
  content = "	学校自体が比較的新しいこともあり校舎はきれいです。広い敷地を生かしたグラウンドも整備されています。"
  users.each { |user| user.microposts.create!(univ: univ, content: content) }
end

# 以下のリレーションシップを作成する
users = User.all
user  = users.first
following = users[2..50]
followers = users[3..40]
following.each { |followed| user.follow(followed) }
followers.each { |follower| follower.follow(user) }