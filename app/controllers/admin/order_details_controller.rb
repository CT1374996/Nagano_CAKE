class Admin::OrderDetailsController < ApplicationController
  before_action :authenticate_admin!
  def index
    @order_details = OrderDetail.all
  end

  def show
    @oder_details = OrderDetais.find(params[:id])
  end

  private
  def order_detail_params
    params.require(order_detail).permit(:order_id, :item_id, :tax_included_price, :amount)
  end
end
