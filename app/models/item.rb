class Item < ApplicationRecord
  has_one_attached :image

  has_many :cart_items, dependent: :destroy
  has_many :order_details

  belongs_to :genre

  validates :name, presence: true
  validates :introduction, presence: true
  validates :price, presence: true
  validates :is_active, inclusion: [true, false]

  #販売ステータスを日本語で表示
  def sale_status
    if is_active == true
      "販売中"
    else
      "販売停止中"
    end
  end


end
