# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Admin.create!(email: 'admin@admin.com',
              password: 'niceadmin'
              )

40.times do |n|
  Customer.create!(
    family_name: "姓#{n + 11}",
    first_name: "名#{n + 11}",
    family_name_kana: "姓(カナ)#{n + 11}",
    first_name_kana: "名（カナ）#{n + 11}",
    email: "example#{n + 11}@test.com",
    password: "testpass#{n + 11}",
    postcode: "12345#{n + 11}",
    address: "testaddress#{n + 11}",
    telephone_number: "090123456#{n + 11}",
    is_active: true
    )
end

Genre.create!(
  [
    {name: "ケーキ"},
    {name: "焼き菓子"},
    {name: "プリン"},
    {name: "キャンディ"},
    {name: "その他"}
  ]
)

Item.create!(
  [
    {
    name: "ショートケーキ",
    introduction: "濃厚な味わいが特徴のショートケーキです",
    price: 400,
    is_active: true,
    genre_id: 1,
    },

    {
    name: "ホールケーキ",
    introduction: "濃厚な味わいが特徴のホールケーキです",
    price: 2400,
    is_active: true,
    genre_id: 1,
    },

    {
    name: "チーズケーキ",
    introduction: "濃厚な味わいが特徴のチーズケーキです",
    price: 400,
    is_active: true,
    genre_id: 1,
    },

    {
    name: "ベリーチーズケーキ",
    introduction: "濃厚な味わいが特徴のチーズケーキにベリーをたっぷり乗せました",
    price: 400,
    is_active: true,
    genre_id: 1,
    },

    {
    name: "チョコレートケーキ",
    introduction: "濃厚な味わいが特徴のチョコレートケーキです",
    price: 400,
    is_active: true,
    genre_id: 1,
    },

    {
    name: "チョコレートソースケーキ",
    introduction: "濃厚な味わいが特徴のチョコレートソースのケーキです",
    price: 400,
    is_active: true,
    genre_id: 1,
    },

    {
    name: "ストロベリーケーキ",
    introduction: "濃厚な味わいが特徴のストロベリーケーキです",
    price: 400,
    is_active: true,
    genre_id: 1,
    },

    {
    name: "生誕記念ケーキ",
    introduction: "濃厚な味わいが特徴の誕生日ケーキです",
    price: 1400,
    is_active: true,
    genre_id: 1,
    },

    {
    name: "ナッツケーキ",
    introduction: "濃厚な味わいが特徴のナッツのケーキです",
    price: 400,
    is_active: true,
    genre_id: 1,
    },

    {
    name: "いちごのタルト",
    introduction: "濃厚な味わいが特徴のいちごのタルトです",
    price: 500,
    is_active: true,
    genre_id: 2,
    },

    {
    name: "ベリーのタルト",
    introduction: "濃厚な味わいが特徴の乗せすぎベリータルトです",
    price: 500,
    is_active: true,
    genre_id: 2,
    },

    {
    name: "チョコプディング",
    introduction: "濃厚な味わいが特徴のチョコのプディングです",
    price: 500,
    is_active: true,
    genre_id: 3,
    },
  ]
)

cake2_image = File.open('app/assets/images/cake2.png')
sato_cake_image = File.open('app/assets/images/sato.cake/きれいなホールケーキ.jpeg')
cake3_image = File.open('app/assets/images/cake3.png')
cheese_cake = File.open('app/assets/images/cheese-cake-7896245_640.jpg')
cake13_image = File.open('app/assets/images/cake13.jpg')
sato_cake2_image = File.open('app/assets/images/sato.cake/溶けかけているチョコケーキ.jpg')
cake10_image = File.open('app/assets/images/cake10.png')
cake11_image = File.open('app/assets/images/cake11.png')
cake5_image = File.open('app/assets/images/cake5.png')
sato_cake3_image = File.open('app/assets/images/sato.cake/イチゴのタルト.jpg')
sato_cake4_image = File.open('app/assets/images/sato.cake/ベリー乗せすぎタルト.jpg')
sato_cake5_image = File.open('app/assets/images/sato.cake/チョコプディング.jpg')


Item.find_by(name: "ショートケーキ").image.attach(io: cake2_image, filename: 'cake2.png', content_type: 'image/*')
Item.find_by(name: "ホールケーキ").image.attach(io: sato_cake_image, filename: 'きれいなホールケーキ.jpeg', content_type: 'image/*')
Item.find_by(name: "チーズケーキ").image.attach(io: cake3_image, filename: 'cake3.png', content_type: 'image/*')
Item.find_by(name: "ベリーチーズケーキ").image.attach(io: cheese_cake, filename: 'cheese-cake-7896245_640.jpg', content_type: 'image/*')
Item.find_by(name: "チョコレートケーキ").image.attach(io: cake13_image, filename: 'cake13.jpg', content_type: 'image/*')
Item.find_by(name: "チョコレートソース").image.attach(io: sato_cake2_image, filename: '溶けかけているチョコケーキ.jpg', content_type: 'image/*')
Item.find_by(name: "ストロベリーケーキ").image.attach(io: cake10_image, filename: 'cake10.png', content_type: 'image/*')
Item.find_by(name: "生誕記念ケーキ").image.attach(io: cake11_image, filename: 'cake11.png', content_type: 'image/*')
Item.find_by(name: "ナッツケーキ").image.attach(io: cake5_image, filename: 'cake5.png', content_type: 'image/*')
Item.find_by(name: "イチゴのタルト").image.attach(io: sato_cake3_image, filename: 'イチゴのタルト.jpg', content_type: 'image/*')
Item.find_by(name: "ベリーのタルト").image.attach(io: sato_cake4_image, filename: 'ベリー乗せすぎタルト.jpg', content_type: 'image/*')
Item.find_by(name: "チョコプディング").image.attach(io: sato_cake5_image, filename: 'チョコプディング.jpg', content_type: 'image/*')