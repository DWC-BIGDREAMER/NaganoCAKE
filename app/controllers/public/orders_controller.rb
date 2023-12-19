class Public::OrdersController < ApplicationController

  def index
    @orders = current_customer.orders
    @total = 0
  end

  def show
    @order = Order.find(params[:id])
    @cart_items = current_customer.cart_items
  end

  def new
    @order = Order.new
  end

  def create
  end 

  def confirm
    cc = current_customer
    # 自身の住所/登録済み住所/新しい住所のどれが選ばれたかを確認。
    which_address = params[:order][:which_address]
    # 登録済み住所が選ばれた場合、そのidからデータを取得
    chosen_address = Address.find(params[:order][:address_id])
    
    order = Order.new(params_order)
    order.customer_id = cc.id
    order.shipping_fee = 800
    order.status = 0
    order.total_payment = cc.cart_items.sum(&:sum)
    
    case which_address.to_i
    # 自身の住所
    when 0 then
      order.name = cc.full_name
      order.postcode = cc.postcode
      order.address = cc.address
    # 登録済み住所
    when 1 then
      order.name = chosen_address.name
      order.postcode = chosen_address.postcode
      order.address = chosen_address.address
    end
    # 新しい住所を選んだ場合、name, postcode, addressは送られてくるので何か処理する必要なし。
    
      
  end

  def compretion
  end
  
  private
  
  def params_order
    params.require(:order).permit(:customer_id,
                                    :name,
                                    :postcode,
                                    :address,
                                    :shipping_fee,
                                    :total_payment,
                                    :payment_method,
                                    :status
                                    )
  end

end
