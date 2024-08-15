class ListsController < ApplicationController
  before_action :set_list, only: [:show, :edit, :update]
  def index
    @lists = List.all
  end
  def show
    @bookmarks = @list.bookmarks
  end

  def new
    @list = List.new
  end

  def create

    @list = List.new(name: list_params[:name])
    if @list.save
      redirect_to list_path(@list)
    else
      render :new, status: :unprocessable_entity
    end
  end


  def edit
  end

  def update
  end
  private

  def list_params
    params.require(:list).permit(:name)
  end

  def set_list
    @list = List.find(params[:id])
  end
end
