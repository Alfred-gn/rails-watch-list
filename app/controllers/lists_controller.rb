class ListsController < ApplicationController
  before_action :set_list, only: [:show, :destroy]
  def index
    @list = List.all
  end

  def show
    @movies = @list.movies
  end

  def new
      @list = List.new # Needed to instantiate the form_with
  end

  def create
    @list = List.new(list_params)
    @list.save
    redirect_to list_path(@list)
  end
  def destroy
    @list.destroy
    # No need for app/views/lists/destroy.html.erb
    redirect_to lists_path, status: :see_other
  end

  private

  def set_list
    @list = List.find(params[:id])
  end

  def list_params
    params.require(:list).permit(:name)
  end
end
