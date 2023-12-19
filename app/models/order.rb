class Order < ApplicationRecord
  has_many :order_details, dependent: :destroy
  has_many :items, through: :order_details
  
  def bill
    n = 0
    n = order.total_payment + order.shipping_fee
    n.to_s(:delimited)
  end 
  
  def my_status
    case self.status
    when 0 then
      "入金待ち"
    when 1 then
      "入金確認"
    when 2 then
      "製作中"
    when 3 then
      "発送準備中"
    when 4 then
      "発送済み"
    end
  end 
end
