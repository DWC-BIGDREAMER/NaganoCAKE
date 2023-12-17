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
  
  #税込価格
  def taxed_price
    (self.price * 1.10).round
  end
  # 税込み価格
  def price_including_tax
    tax = 0.1
    intax = price + price * tax
    
    # 小数点以下0を消す
    intax = intax.to_i
    
    # 3桁区切り表示にする
    intax.to_s(:delimited)
  end 

end
