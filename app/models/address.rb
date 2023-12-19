class Address < ApplicationRecord
  belongs_to :customer
  
  # order.new.htmlのセレクトボックスで送り先を表示するためのメソッド
  def address_display
    '〒' + postcode + ' ' + address + ' ' + name
  end 
  
end
