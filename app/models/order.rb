class Order < ApplicationRecord
  has_many :order_details, dependent: :destroy
  has_many :items, through: :order_details
  belongs_to :customer

  def which_pay
    case self.payment_method
    when 0 then
      "クレジットカード"
    when 1 then
      "銀行振込"
    end
  end

  #enum支払い
  enum payment_method: {
    credit_card: 0,
    bank_transfer: 1
  }

  #enum注文
  enum status: {
    waiting: 0,
    paid_up: 1,
    making: 2,
    preparing: 3,
    shipping: 4
  }

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

  #注文時間（年/月/日）
  def y_to_d
    self.created_at.strftime('%Y/%m/%d')
  end

  # 注文時間（年/月/日 時間:分:秒）
  def y_to_s
    self.created_at.strftime('%Y/%m/%d %H:%M:%S')
  end

end
