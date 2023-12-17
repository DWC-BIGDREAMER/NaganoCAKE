class Admin::GenresController < ApplicationController
  def index
    @genres = Genre.all
  end

  def create
    if genre = Genre.create(genre_params)
      genres = Genre.all
      redirect_to admin_genres_path(genres)
    else
      render :index
    end
  end

  def edit
    @genre = Genre.find(params[:id])
  end

  def update
    @genre = Genre.find(params[:id])
    if @genre.update(genre_params)
      redirect_to admin_genres_path
    else
      render :edit
    end
  end

  private

  def genre_params
    params.require(:genre).permit(:name)
  end

end
