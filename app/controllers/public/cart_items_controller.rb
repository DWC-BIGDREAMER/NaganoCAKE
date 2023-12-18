class Public::CartItemsController < ApplicationController
  
  def index
    # @cart_items = CartItem.where(customer_id: current_customer.id)
    @cart_items = current_customer.cart_items
    @total = 0
  end 
  
  def update
    cart_item = CartItem.find(params[:id])
    cart_item.update(cart_item_params)
    redirect_to cart_items_path
  end 
  
  def destroy
    cart_item = CartItem.find(params[:id])
    cart_item.destroy
    redirect_to cart_items_path
  end 
  
  def destroy_all
    cart_items = current_customer.cart_items
    cart_items.each do |ci|
      ci.destroy
    end 
    redirect_to cart_items_path
  end 
  
  def create
  end 
  
  private
  
  def cart_item_params
    params.require(:cart_item).permit(:amount)
  end 
  
end
