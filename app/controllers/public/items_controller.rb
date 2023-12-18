class Public::ItemsController < ApplicationController

  def index
    @items = Item.page(params[:page]).per(8).order('created_at DESC')
    @items_count = Item.count
    @genres = Genre.all
  end

  def show
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

end
