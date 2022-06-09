class Admin::ItemsController < ApplicationController

  def new
    @item = Item.new
  end

  def create
    @item =Item.new(item_params)
    @item.save
    redirect_to admin_item_path(@item)
  end

  def show
  end

  def index
    @items =Item.all
  end


  private

  def item_params
    params.require(:item).permit(:name, :introduction, :price, :image_id)
  end

end
