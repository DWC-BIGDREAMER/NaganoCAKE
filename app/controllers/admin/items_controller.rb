class Admin::ItemsController < ApplicationController
  #before_action :authenticate_admin!

  def new
    @item = Item.new
  end

  def index
    @items = Item.page(params[:page]).per(10)
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      flash[:notice] = "商品を追加しました。"
      redirect_to admin_item_path(@item)
    else
      flash.now[:alert] = "商品を追加できませんでした。"
      render "new"
    end
  end

  def show
    @item = Item.find(params[:id])
  end

  def edit
    @item = Item.find(params[:id])
  end

  def update
    @item = Item.find(params[:id])
    if @item.update(item_params)
      redirect_to admin_item_path(@item)
    else
      render "show"
    end
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
