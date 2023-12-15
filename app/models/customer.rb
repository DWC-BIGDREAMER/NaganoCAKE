class Customer < ApplicationRecord

  has_many :orders
  has_many :cart_items, dependent: :destroy
  has_many :addresses, dependent: :destroy

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

end
