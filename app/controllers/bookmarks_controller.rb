class BookmarksController < ApplicationController
  before_action :get_list, only: [:new, :create]
  def new
    @bookmark = Bookmark.new
  end

  def create
    @bookmark = Bookmark.new(bookmark_params)
    @bookmark.list = @list

    if @bookmark.save
      redirect_to list_path(@list)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @list = Bookmark.find(params[:id]).list
    Bookmark.delete(params[:id])
    redirect_to list_path(@list)
  end
  private
  def bookmark_params
    params.require(:bookmark).permit(:movie_id, :comment)
  end

  def get_list
    @list = List.find(params[:list_id])
  end
end
