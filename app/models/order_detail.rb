class OrderDetail < ApplicationRecord
  belongs_to :order
  belongs_to :item

    # 税込み価格×個数で小計を算出
  def sum
    item.taxed_price * amount
  end
  
  #enum製作
  enum making_status: {
    impossible: 0,
    waiting: 1,
    making: 2,
    making_completed: 3
  }

end
