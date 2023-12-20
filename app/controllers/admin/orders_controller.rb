class Admin::OrdersController < ApplicationController
  def show
    @od = Order.find(params[:id])
    @ols = @od.order_details
    
  end 
  
  def index
    @customer = Customer.find(params[:customer_id])
    @orders = @customer.orders.page(params[:page])
  end 
  
  def update
    @order = Order.find(params[:id])
    @order.update(params_order)
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
