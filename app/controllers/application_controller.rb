class ApplicationController < ActionController::Base
  before_action :authenticate_admin!, if: :admin_area?
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

private

  def admin_area?
    request.fullpath.include?("/admin") && !request.fullpath.include?("/admin/sign_in")
  end

end
