class Public::OrdersController < ApplicationController

  def new
    @order = Order.new
  end

  def create
    @order = Order.new(order_params)
    @order.customer_id = current_customer.id
    @order.shipping_cost = 800
    if @order.save!
      #子モデルを作る
      #@orders = OrderDetail.all
      current_customer.cart_items.each do |cart_item|
      order_derail = OrderDerail.new
      order_derail.order_id = @order.id
      order_derail.item_id = cart_item.item.id
      order_derail.price = cart_item.item.with_tax_price
      order_derail.amount = cart_item.amount
      order_derail.save
      end
    current_customer.cart_items.destroy_all
    end
    redirect_to orders_completion_path
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
    @orders = current_customer.orders
  end

  def show
    @order = Order.find(params[:id])
    @order_details = @order.order_derails
    @total = 0
    #@order_details.each do |order_detail|
      #@total += order_detail.subtotal
    #end
    #@total_payment = @total + @order.shipping_cost
  end

  private

  def order_params
    params.require(:order).permit(:payment_method, :postal_code, :address, :name, :status, :shipping_cost, :custome, :total_payment)
  end
end
