class Public::CustomersController < ApplicationController

  def show
    @cus = current_customer
  end

  def edit
    @cus = current_customer
  end

  def update
    customer = current_customer
    customer.update(customer_params)
    redirect_to customers_my_page_path
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
