class Item < ApplicationRecord
  has_one_attached :image
  
  has_many :cart_items, dependent: :destroy
  has_many :order_details
  belongs_to :genre
  
  validates :name, presence: true
  validates :introduction, presence: true
  validates :price, presence: true
  validates :is_active, inclusion: [true, false]

end
