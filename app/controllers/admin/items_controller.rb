class Admin::ItemsController < ApplicationController

  def new
    @item = Item.new
    @genres =Genre.all
  end

  def create
    @item =Item.new(item_params)
    @item.save
    redirect_to admin_item_path(@item)
  end

  def show
    @item =Item.find(params[:id])
  end

  def index
    @items =Item.all
    @genres =Genre.all
  end

  def edit
    @item =Item.find(params[:id])
    @genres =Genre.all
  end

  def update
    @item =Item.find(params[:id])
    @item.update(item_params)
    redirect_to admin_item_path
  end

  private

  def item_params
    params.require(:item).permit(:name, :introduction, :price, :image, :genre_id, :is_active)
  end
end
