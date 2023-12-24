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
