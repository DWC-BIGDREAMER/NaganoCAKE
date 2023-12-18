class Public::ItemsController < ApplicationController
  before_action :genre_all

  def index
    @items = Item.page(params[:page]).per(8).order('created_at DESC')
    @items_count = Item.count
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

  def genre_all
    @genres = Genre.all
  end

end
