class BookmarksController < ApplicationController
  before_action :set_list, only: [:new, :create, :destroy]

  def index
    @bookmarks = Bookmark.all
  end

  def new
    @bookmark = Bookmark.new
  end

  def create
    @list = List.find(params[:list_id])
    @bookmark = Bookmark.new(bookmark_params)
    @bookmark.list = @list
    if @bookmark.save
      redirect_to list_path(@list)
   else
      render :new
    end
  end

  def destroy
    @bookmark.destroy
    redirect_to bookmarks_path
  end

  private
  
  def set_list
    @list = List.find(params[:list_id])
  end

  def bookmark_params
    params.require(:bookmark).permit(:comment, :movie_id)
  end

end
