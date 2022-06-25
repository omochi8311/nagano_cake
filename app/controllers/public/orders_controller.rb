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
    @cart_items.each do |cart_item|
    @total +=  (cart_item.amount * cart_item.item.price * 1.1).floor
    end
    @order = Order.new(order_params)
    @address = Address.find(params[:order][:address_id])
    @order.postal_code = @address.postal_code
    @order.address = @address.address
    @order.name = @address.name
    @order.shipping_cost = 800
    @order.status = 0
    @order.customer_id = current_customer.id
      if params[:order][:address_display] == "1"
        @order.address = current_customer.address
        @order.name = current_customer.last_name + current_customer.first_name
        @order.postal_code = current_customer.postal_code
      elsif params[:order][:address_display] == "2"
        @address = Address.find(params[:order][:address_id])
        @order.postal_code = @address.postal_code
        @order.address = @address.address
        @order.name = @address.name
      elsif params[:order][:address_display] == "3"
        @order.postal_code = params[:order][:postal_code]
        @order.address = params[:order][:address]
        @order.name = params[:order][:name]
      end
  end

  def index
  end

  private

  def order_params
    params.require(:order).permit(:payment_method, :postal_code, :address, :name)
  end
end
