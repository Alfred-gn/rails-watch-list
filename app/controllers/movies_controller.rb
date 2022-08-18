class MoviesController < ApplicationController

  def index
    @movie = Movie.all
  end
  def new
    @movie = Movie.new
  end

  def create
    @movie = Movie.new(movie_params)
  if @movie.save
    redirect_to lists_path
  else
    render :new, status: :unprocessable_entity
  end
  end


  private

  def list_params
    params.require(:movie).permit(:title, :overview)
  end
end
