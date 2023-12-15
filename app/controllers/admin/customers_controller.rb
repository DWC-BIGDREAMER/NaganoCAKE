class Admin::CustomersController < ApplicationController
  def index
    @customers = Customer.all
  end

  def show
    @cus = Customer.find(params[:id])
  end

  def edit
    @customer = Customer.find(params[:id])
  end

  def update
  end
end
