class Public::HomesController < ApplicationController
  before_action :genre_all

  def top
    @items = Item.page(params[:page]).per(4).order('created_at DESC')
    @items_count = Item.count
  end

  def about
  end

private

  def genre_all
    @genres = Genre.all
  end

end
