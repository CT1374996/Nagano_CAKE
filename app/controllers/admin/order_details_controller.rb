class Admin::OrderDetailsController < ApplicationController
  before_action :authenticate_admin!
  def show
    @order_detail = OrderDetail.find(params[:id])
  end

  private
  def order_detail_params
    params.require(order_detail).permit(:order_id, :item_id, :tax_included_price, :amount)
  end
end
