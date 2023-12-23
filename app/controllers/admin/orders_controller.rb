class Admin::OrdersController < ApplicationController
  def show
    @od = Order.find(params[:id])
    @ols = @od.order_details
    @total = @ols.sum(&:sum)
    @bill = @total + @od.shipping_fee
  end

  def index
    @customer = Customer.find(params[:customer_id])
    @orders = @customer.orders.page(params[:page]).per(10)
  end

  def update
    @order = Order.find(params[:id])
    new_status = params[:order][:status]

    @order.update(params_order)

    if new_status == "paid_up" # 注文ステータスが「入金確認」
      @order.order_details.update_all(making_status: :waiting) # すべての製作ステータスを「製作待ち」に更新
    elsif @order.order_details.all? { |ol| ol.making_status == "making_completed" } # 全ての製作ステータスが「製作完了」
      @order.update(status: :preparing) # 注文ステータスを「発送準備中」に更新
    elsif @order.order_details.any? { |ol| ol.making_status == "making" } # 製作ステータスに「製作中」が含まれている場合
      @order.update(status: :making) # 注文ステータスを「製作中」に更新
    end

    redirect_to admin_order_path(@order)
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
