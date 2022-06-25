class Public::OrdersController < ApplicationController

  def new
    @order = Order.new
  end

  def create
    order = Order.new(order_params)
    order.save
    redirect_to orders_confirmation_path
  end

  def confirmation
    @cart_items = current_customer.cart_items
    @total = 0
    @order = Order.new(order_params)
    binding.pry
  end

  private

  def order_params
    params.require(:order).permit(:payment_method)
  end
end
