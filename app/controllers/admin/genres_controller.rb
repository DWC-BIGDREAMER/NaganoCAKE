class Admin::GenresController < ApplicationController
  def index
    @genres = Genre.all
  end

  def create
    if genre = Genre.create(genre_params)
      genres = Genre.all
      redirect_to admin_genres_path(genres)
    else
      reder :index
    end 
  end

  def edit
  end

  def update
  end
  
  private
  
  def genre_params
    params.require(:genre).permit(:name)
  end 
  
end
