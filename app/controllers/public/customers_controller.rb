class Public::CustomersController < ApplicationController

 def show
    @customer = current_customer
 end

 def edit
   @customer = Customer.find(params[:id])
 end

 def withdrawal
   @customer = Customer.find(params[:id])
   @customer.update(is_deleted: true)
   reset_session
   redirect_to customers_my_page_path
 end

 def update
   @customer = Customer.find(params[:id])
   @customer.update(customer_params)
   redirect_to customers_my_page_path
 end

  private

  def customer_params
    params.require(:customer).permit(:is_deleted, :last_name, :first_name, :last_name_kana, :first_name_kana, :email, :encrypted_password, :postal_code, :address, :telephone_number)
  end
end
