class BookmarksController < ApplicationController

  def new
    @list = List.find(params[:list_id])
    @bookmark = Bookmark.new
  end

  def create
    @bookmark = Bookmark.new(bookmark_params)
    @list = List.find(params[:list_id])
    @bookmark.list = @list
    if @bookmark.save
      redirect_to bookmark_path(@bookmark)
    else
      render :new
  end

  def bookmark_params
    params.require(:bookmark).permit(:comment :movie_id :list_id)
  end
end
