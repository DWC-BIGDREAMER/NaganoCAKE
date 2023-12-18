class CartItem < ApplicationRecord
  belongs_to :customer
  belongs_to :item
  
  # 税込み価格×個数で小計を算出
  def sum
    item.taxed_price * amount
  end 
  
  
end
