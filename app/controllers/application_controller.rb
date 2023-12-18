class ApplicationController < ActionController::Base
  before_action :set_search

  def set_search
    @q = Item.ransack(params[:q])
    @search = @q.result(distinct: true)
  end

end
