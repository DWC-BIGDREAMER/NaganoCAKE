# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# Admin.create!(email: 'admin@a',
#               password: 'niceadmin'
#               )

# 3.times do |n|
#   email = "example#{n + 1}@test.com"
#   Customer.create!(
#     family_name: "姓#{n + 1}",
#     first_name: "名#{n + 1}",
#     family_name_kana: "姓(カナ)#{n + 1}",
#     first_name_kana: "名（カナ）#{n + 1}",
#     email: email,
#     password: "testpass#{n + 1}",
#     postcode: "111111#{n + 1}",
#     address: "testaddress#{n + 1}",
#     telephone_number: "0901234567#{n + 1}",
#     is_active: true
#     )
# end 

# CartItem.create!(
#                 item_id: 1,
#                 customer_id: 1,
#                 amount: 1
#                 )

# CartItem.create!(
#                 item_id: 2,
#                 customer_id: 1,
#                 amount: 2
#                 )

3.times do |n|
  CartItem.create!(
    item_id: n + 1,
    customer_id: 1,
    amount: 1
    )
  end