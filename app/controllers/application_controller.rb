class ApplicationController < ActionController::Base
  before_action :set_search


  def set_search
    if admin_signed_in?
      @p = Customer.ransack(params[:q])
      @search = @p.result(distinct: true)
    else
      @q = Item.ransack(params[:q])
      @search = @q.result(distinct: true)
    end
    @result = params[:q]&.values&.reject(&:blank?)
  end

end
