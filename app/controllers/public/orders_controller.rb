class Public::OrdersController < ApplicationController
  before_action :authenticate_customer!
  def new
   @order = Order.new
   @customer = current_customer
   @order.receiver_name = current_customer.last_name + current_customer.first_name
   @order.receiver_postal_code = current_customer.postal_code
   @order.receiver_address = current_customer.address
  end

  def confirm
    @order = Order.new(order_params)
   @order.receiver_name = current_customer.last_name + current_customer.first_name
   @order.receiver_postal_code = current_customer.postal_code
   @order.receiver_address = current_customer.address
    @customer = current_customer
    @cart_items = current_customer.cart_items
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
    @cart_items = current_customer.cart_items
    @cart_items.each do |cart_item|
      order_detail = OrderDetail.new
      order_detail.order_id = @order.id
      order_detail.item_id = cart_item.item.id
      order_detail.tax_included_price = cart_item.item.with_tax_price
      order_detail.amount = cart_item.amount

      order_detail.save
    end
    redirect_to orders_complete_path
  end

  def index
    @orders = current_customer.orders
  end

  def show
    @order = Order.find(params[:id])
  end

  private
  def order_params
    params.require(:order).permit(:payment_method, :receiver_name, :receiver_postal_code, :receiver_address, :shipping_fee, :monetary_amount)
  end
end
