class Public::CartItemsController < ApplicationController
  before_action :authenticate_customer!
  def index
    @cart_items = CartItem.all
  end

  def update
    @cart_item.update(cart_item_params)
  end

  def destroy
  end

  def destroy_all
  end

  def create
  end

  private
  def cart_item_params
    params.require(:cart_item).permit(:item_id, :amount)
  end
end
