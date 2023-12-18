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
  end

  def create
  end

  def confirm
  end

  def compretion
  end

end
