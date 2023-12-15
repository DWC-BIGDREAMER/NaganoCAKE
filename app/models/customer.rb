class Customer < ApplicationRecord
  has_many :orders
  has_many :cart_items, dependent: :destroy
  has_many :addresses, dependent: :destroy
end
