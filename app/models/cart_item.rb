class CartItem < ApplicationRecord
  belongs_to :customer
  belongs_to :item
  
  # 税込み価格×個数で小計を算出
  def sum
    item.price_including_tax * amount
  end 
  
  # 小計を全部足した合計を算出
  # total = 0
  # items.sum.each for i
  # total = items.sum
  
end
