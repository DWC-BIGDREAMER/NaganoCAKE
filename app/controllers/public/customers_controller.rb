class Public::CustomersController < ApplicationController

  def show
    @cus = current_customer
  end

  def edit
    @cus = current_customer
  end

  def update
    customer = current_customer
    if customer.update(customer_params)
      redirect_to update_customer_path
    else
      flash[:error] = "更新に失敗しました"
      render :edit
    end
  end

  def withdraw
    @cus = Customer.find(current_customer.id)
    @cus.update(is_active: false)
    reset_session
    redirect_to root_path
  end

private

  def customer_params
    params.require(:customer).permit(:family_name,
                                     :first_name,
                                     :family_name_kana,
                                     :first_name_kana,
                                     :postcode,
                                     :address,
                                     :telephone_number,
                                     :email,
                                    )
  end

end
