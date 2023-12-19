class Admin::ItemsController < ApplicationController
  before_action :authenticate_admin!
  def index
    @item = Item.all
  end

  def new
    @items = Item.new
  end

  def create
    @item = Item.new(item_params)
    @item.save
    redirect_to item_path
  end

  def show
  end

  def edit
  end

  def update
  end

  private
  def item_params
    params.require(:item).permit(:name, :introduction, :price)
  end
end
