# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

prefecture_names = ["北海道","青森県","岩手県","宮城県","秋田県","山形県","福島県",
"茨城県","栃木県","群馬県","埼玉県","千葉県","東京都","神奈川県",
"新潟県","富山県","石川県","福井県","山梨県","長野県","岐阜県",
"静岡県","愛知県","三重県","滋賀県","京都府","大阪府","兵庫県",
"奈良県","和歌山県","鳥取県","島根県","岡山県","広島県","山口県",
"徳島県","香川県","愛媛県","高知県","福岡県","佐賀県","長崎県",
"熊本県","大分県","宮崎県","鹿児島県","沖縄県"]

prefectures = prefecture_names.map do |name|
  Prefecture.create!(name: name)
end

category_names = %w(食品 アクセサリー 衣類 雑貨品)
categories = category_names.map do |name|
  Category.create!(name: name)
end

souvenir_names = %w(ザビエル かぼす お土産A お土産B お土産C お土産D お土産E)
souvenir_names.each do |name|
  Souvenir.create!(name: name)
end

users = (1..10).map do |i|
  User.create!(
    name: Faker::Name.name,
    email: "user#{i}@test.com",
    password: "password"
  )
end

(1..100).each do |n| 
  Post.create!( user: users.sample,
                caption: "test#{n}",
                category: categories.sample,
                souvenir_name: souvenir_names.sample,
                prefecture: prefectures.sample)
end

Admin.create!(email: 'admin@test.com', password: 'password')