class Public::OrdersController < ApplicationController

  def index
    @orders = current_customer.orders
  end

  def show
    # 確認画面でリロードした際に、@orderが空のため発生するエラーの解消無理やり。余裕があれば見直す。
    if params[:id] == "confirm"
      redirect_to new_order_path
    else
      @order = Order.find(params[:id])
      @ols = @order.order_details
    end
  end

  def new
    @order = Order.new
  end

  def create
    order = Order.new(params_order)
    if order.save

      # カート内商品は消すので、情報を注文詳細に移す。
      current_customer.cart_items.each do |ci|
        ol = OrderDetail.new
        ol.order_id = order.id
        ol.item_id = ci.item_id
        ol.price = ci.item.taxed_price
        ol.amount = ci.amount
        ol.making_status = :impossible
        ol.save
      end
      current_customer.cart_items.destroy_all
      redirect_to thanks_orders_path
    else
      @orders = current_customer.orders
      flash.now[:alert] = "注文できませんでした。"
      render :index

    end
  end

  def confirm
    @cc = current_customer
    @cart_items = @cc.cart_items
    # 自身の住所/登録済み住所/新しい住所のどれが選ばれたかを確認。
    which_address = params[:order][:which_address]
    # 登録済み住所が選ばれた場合、そのidからデータを取得
    if which_address == "1"
      if params[:order][:address_id].present?
        chosen_address = Address.find(params[:order][:address_id])
      else
        # 登録済み住所がない場合の処理
        flash[:alert] = "登録された住所が見つかりませんでした。"
        redirect_to new_order_path
        return
      end
    end

    @order = Order.new(params_order)
    @order.customer_id = @cc.id
    @order.shipping_fee = 800
    @order.status = :waiting
    @order.total_payment = @cc.cart_items.sum(&:sum)

    case which_address.to_i
    # 自身の住所
    when 0 then
      @order.name = @cc.full_name
      @order.postcode = @cc.postcode
      @order.address = @cc.address
    # 登録済み住所
    when 1 then
      @order.name = chosen_address.name
      @order.postcode = chosen_address.postcode
      @order.address = chosen_address.address
    when 2 then
      # nameかaddressかpostcodeが空の場合弾く
      # もっと賢い書き方あるだろうけど分からない。
      if @order.name == "" || @order.address == "" || @order.postcode == ""
        flash[:alert] = "未記載の箇所があります。"
        redirect_to new_order_path
        return
      end
    end
    # 新しい住所を選んだ場合、name, postcode, addressは送られてくるので何か処理する必要なし。
    @total_sum = @cart_items.sum(&:sum)
    @total_payment = @total_sum + 800
  end

  def thanks
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
                                    :status,
                                    )
  end
end
