class Admin::HomesController < ApplicationController
  before_action :authenticate_admin!
  def top
  end

  def index
    @order_details = OrderDetail.all
  end
end
