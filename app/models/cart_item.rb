class CartItem < ApplicationRecord
  belongs_to :customer
  belongs_to :item
  
  # 税込み価格×個数で小計を算出
  def sum
    item.taxed_price * amount
  end 
  
  # カート内商品の最大表示数。10個を超える場合はamount、超えない場合は10を表示
  def variable
    if self.amount > 10
      self.amount
    else
      10
    end 
  end
  
end
