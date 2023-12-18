class Order < ApplicationRecord
  has_many :order_details, dependent: :destroy
  
  def bill
    n = 0
    n = order.total_payment + order.shipping_fee
    n.to_s(:delimited)
  end 
  
end
