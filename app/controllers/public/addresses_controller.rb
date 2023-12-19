class Public::AddressesController < ApplicationController

  def index
    @addresses = current_customer.addresses
    @address = Address.new
  end

  def create
    @address = Address.new(address_params)
    @address.customer_id = current_customer.id
    if @address.save
      redirect_to addresses_path
    else
      @addresses = current_customer.addresses
      render :index
    end
  end

  def edit
    @address = Address.find(params[:id])
  end

  def update
    @address = Address.find(params[:id])
    @address.update
    redirect_to addresses_path
  end

  def destroy
    @address = Address.find(params[:id])
    @address.destroy
    redirect_to request.referer
  end

private

  def address_params
    params.require(:address).permit(:name, :address, :postcode)
  end

end
