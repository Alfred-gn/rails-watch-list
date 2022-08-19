class BookmarksController < ApplicationController
  before_action :set_list, only: [:new]
  def new
    @bookmark = Bookmark.new
  end

  def create
    @bookmark = Bookmark.new(bookmark_params)
    @bookmark.list = @list
    @bookmark.save
    redirect_to list_path(@list)
  end

  def destroy
    @bookmark = Bookmark.find(params[:id])
    @bookmark.destroy
    redirect_to list_path(@bookmark.list), status: :see_other
  end

  private

  def set_list
    @list = List.find(params[:list_id])
  end

  def list_params
    params.require(:list).permit(:comment, :movie)
  end
end
