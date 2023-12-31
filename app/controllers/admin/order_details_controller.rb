class Admin::OrderDetailsController < ApplicationController
  def update
    ol = OrderDetail.find(params[:order_detail][:order_detail_id])
    od = Order.find(params[:id])
    ol.update(params_order_detail)
    
    if ol.making_status == "making"
      od.update(status: :making)
    end
    
    if od.order_details.all? {|order_detail| order_detail.making_status == "making_completed"}
      od.update(status: :preparing)
    end
  
    redirect_to admin_order_path(ol.order)
    @od = Order.find(params[:id])
    @ols = @od.order_details
  end 
  
  private
  
  def params_order_detail
    params.require(:order_detail).permit(:order_id,
                                         :item_id,
                                         :price,
                                         :amount,
                                         :making_status
                                          )
  end 
end
