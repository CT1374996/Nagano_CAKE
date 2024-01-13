class Public::OrdersController < ApplicationController
  before_action :authenticate_customer!
  def new
    @order = Order.new
  end

  def confirm
    @order = Order.new(order_params)
    @order.receiver_postal_code = current_customer.postal_code
    @order.receiver_address = current_customer.address
    @order.receiver_name = current_customer.last_name + current_customer.first_name
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
    params.require(:order).permit(:receiver_postal_code, :receiver_address, :receiver_name, :payment_method, :monetary_amount)
  end
end
