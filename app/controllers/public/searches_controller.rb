class Public::SearchesController < ApplicationController
  
  def genre_search
    @genre = Genre.find(params[:genre_id])
    @genre_id = params[:genre_id]
    @items = Item.where(genre_id: params[:genre_id]).page(params[:page]).per(8).order('created_at DESC')
    @total_items_count = @items.total_count
  end
  
end
