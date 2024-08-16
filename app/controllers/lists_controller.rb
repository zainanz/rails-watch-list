class ListsController < ApplicationController
  before_action :set_list, only: %i[ show edit update destroy ]
  def index
    @lists = List.all
    @picture = 'https://i.pinimg.com/236x/84/1f/50/841f507da4e560ddb2743010e08f668f--cool-hand-luke-lemony-snicket.jpg';
  end
  def show
    @bookmarks = @list.bookmarks
  end

  def new
    @list = List.new
  end

  def create
    @list = List.new(list_params)
    if @list.save
      redirect_to list_path(@list)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @list.destroy
    redirect_to lists_path
  end

  def edit
  end

  def update
    @list.update(list_params)
    if @list.valid?
      redirect_to list_path(@list)
    else
      render :edit, status: :unprocessable_entity
    end
  end
  private

  def list_params
    params.require(:list).permit(:name, :photo)
  end

  def set_list
    @list = List.find(params[:id])
  end
end
