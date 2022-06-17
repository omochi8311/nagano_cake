class Public::AddressesController < ApplicationController

  def index
    @address = Address.new
    @addresses = Address.all
  end

  def edit
    @address =Address.find(params[:id])
  end

  private

  def address_params
    params.require(:address).permit(:customer_id, :name, :postal_code, :address)
  end
end
