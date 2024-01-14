class Public::OrdersController < ApplicationController
  before_action :authenticate_customer!
  def new
   @order = Order.new
   @customer = current_customer
  end

  def confirm
    @order = Order.new(order_params)
    binding.pry
    @customer = current_customer
    @total = 0
    @order.shipping_fee = 800
  end

  def complete
    @customer = current_customer
    current_customer.cart_items.destroy_all
  end

  def create
    @order = Order.new(order_params)
    @order.customer_id = current_customer.id
    @order.save
  end

  def index
    @orders = current_customer.orders
  end

  def show
    @order = Order.find(params[:id])
  end

  private
  def order_params
    params.require(:order).permit(:payment_method)
  end
end
