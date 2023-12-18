class Public::CustomersController < ApplicationController
  before_action :authenticate_customer!
  def show
    @customer = current_customer
  end

  def edit
    @customer = current_customer
  end

  def update
  end

  def confirm
  end

  def withdrawal
    @customer = Customer.find(params[:id])
    @customer.update(is_active = false)
    reset_session
    redirect_to root_path
  end
end
