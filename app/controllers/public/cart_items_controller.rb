class Public::CartItemsController < ApplicationController
  before_action :authenticate_customer!
  def index
    @cart_items = CartItem.all
  end

  def update
    @cart_item = CartItem.find(params[:id])
    @cart_item.update(cart_item_params)
  end

  def destroy
    cart_item.destroy
  end

  def destroy_all
    cart_item.destroy_all
  end

  def create
    @cart_item = CartItem.new(cart_item_params)
    @cart_item.customer_id = current_customer.id
    @cart_item.save
  end

  private
  def cart_item_params
    params.require(:cart_item).permit(:item_id, :amount)
  end
end
