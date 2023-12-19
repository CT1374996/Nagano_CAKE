class Public::CustomersController < ApplicationController
  before_action :authenticate_customer!
  def show
    @customer = current_customer
  end

  def edit
    @customer = current_customer
  end

  def update
    if @customer.update(current_customer)
      redirect_to customers_mypage_path(current_customer)
    else
      render :edit
    end
  end

  def confirm
    @customer = current_customer
  end

  def withdrawal
    @customer.update(is_active = false)
    reset_session
    redirect_to customers_withdrawal_path
  end
end
