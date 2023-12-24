class Public::ItemsController < ApplicationController
  before_action :genre_all

  def index
    @items = Item.page(params[:page]).per(8).order('created_at DESC')
    @total_items_count = @items.total_count
  end

  def show
    @item = Item.find(params[:id])
    @cart_item = CartItem.new
  end

private

  def item_params
    params.require(:item).permit(:genre_id,
                                 :name,
                                 :introduction,
                                 :price,
                                 :is_active,
                                 :image
                                 )
  end

  def genre_all
    @genres = Genre.all
  end

end
